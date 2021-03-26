# Maintainer: Carlo Abelli <carlo@abelli.me>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Federico Cinelli <cinelli@aur.archlinux.org>
# Contributor: Thomas Dziedzic  < gostrc at gmail >
# Contributor: Gabriel Martinez < reitaka at gmail dot com >

pkgname=ifuse
pkgver=1.1.4
pkgrel=1
pkgdesc='A fuse filesystem to access the contents of an iPhone or iPod Touch'
url='https://libimobiledevice.org/'
arch=('x86_64')
license=('LGPL2.1')
depends=('libimobiledevice' 'fuse2')
source=("$pkgname-$pkgver::https://github.com/libimobiledevice/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2a00769e8f1d8bad50898b9d00baf12c8ae1cda2d19ff49eaa9bf580e5dbe78c')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
