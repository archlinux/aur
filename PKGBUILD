# Maintainer: Zacharias Knudsen <z@chari.as>

pkgname=pg_tle-git
pkgver=v1.0.1.r20.gb2b84d1
pkgrel=1
pkgdesc="Framework for building trusted language extensions for PostgreSQL"
arch=('x86_64')
url="https://github.com/aws/pg_tle"
license=('APACHE')
depends=()
makedepends=('git' 'make')
source=("$pkgname::git+$url")
sha512sums=(SKIP)

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
