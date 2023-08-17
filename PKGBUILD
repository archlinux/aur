# Maintainer: Jonathan Neidel <aur@jneidel.com>

pkgname=fjira
pkgver="0.10.0"
pkgrel=1
pkgdesc="CLI Interface for Jira"
arch=(any)
url="https://github.com/mk-5/fjira"
license=(AGPL3)
depends=()
makedepends=(go)
optdepends=()
provides=(fjira)
source=("https://github.com/mk-5/fjira/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("4367463e2248b960d426285114104a714cf2ebb2f4115e0a765fb7681d6c2626")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make
}
package() {
  install -Dm755 "$srcdir/${pkgname}-${pkgver}/out/bin/fjira" "$pkgdir/usr/bin/fjira"
}
