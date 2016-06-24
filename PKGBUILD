# Maintainer: Olivier Biesmans <o.archlinux@biesmans.fr>

pkgname=certigo
pkgver=1.1.0
pkgrel=1
pkgdesc='A utility to examine and validate certificates in a variety of formats'
arch=('x86_64' 'i686')
url='https://github.com/square/certigo'
license=('MIT')
makedepends=('go' 'git')
depends=('glibc')
source=("https://github.com/square/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1ca8ee1130d57fb70b1c21cc9311d8b036b86d456eb88888d603e88fbb1d056a')

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
