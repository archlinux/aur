# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=clean-chroot-manager
pkgver=2.221
pkgrel=1
pkgdesc='Wrapper for managing clean chroot builds with local repo therein.'
arch=('any')
url='https://github.com/graysky2/clean-chroot-manager'
license=('MIT')
depends=('devtools>=20190821-1' 'rsync' 'libarchive>=3.3.3' 'pacman>=5.2')
conflicts=('clean_chroot_manager')
replaces=('clean_chroot_manager')
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/clean-chroot-manager/archive/v$pkgver.tar.gz")
b2sums=('409bc9901515a93b8f37d94719e42c4bb8b848a891c82b83c3da6b8bfb92c1f72821e941392828d99448e4f6fcfc64eb2a46b4db31815f81fd75f472b7f40396')
install=ccm.install

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
