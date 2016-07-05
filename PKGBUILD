# Maintainer: Olivier Biesmans <o.archlinux@biesmans.fr>

pkgname=certigo
pkgver=1.2.0
pkgrel=1
pkgdesc='A utility to examine and validate certificates in a variety of formats'
arch=('x86_64' 'i686')
url='https://github.com/square/certigo'
license=('MIT')
makedepends=('go' 'git')
depends=('glibc')
source=("https://github.com/square/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b3613cc2580203c320765171ee6c837b357a429dc80fc3ca404e07082e3d9922')

build() {
  cd "$pkgname-$pkgver"

  ./build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
