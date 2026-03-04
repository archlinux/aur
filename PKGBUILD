# Maintainer: Damglador <damglador@gmail.com>

pkgname=passkeyd-qt
pkgver=0.5.0
pkgrel=1
pkgdesc="A Qt UI for passkeyd"
arch=("any")
url="https://github.com/Damglador/passkeyd-qt"
license=("GPL-3.0")
depends=("passkeyd" "python-pydantic" "python-pam" "pyside6")
makedepends=("git" "cargo")
source=("git+$url.git#tag=${pkgver}")
sha256sums=('SKIP')
options=("!lto")

build() {
  cd "$pkgname"
  make build
}

package() {
  cd "$pkgname"
  make INSTALL_PREFIX="$pkgdir" install
}
