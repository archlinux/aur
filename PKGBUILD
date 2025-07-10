# Maintainer: Texas0295 <texas0295@outlook.com>

pkgname=evap
pkgver=0.1.0
pkgrel=1
pkgdesc="Ephemeral editing buffer with zero residue"
arch=('x86_64')
url="https://github.com/Texas0295/evap"
license=('MIT')
depends=()
makedepends=('git' 'make' 'gcc')
conflicts=('evap-git')
provides=('evap')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('def559def6b769bde6f63659bafc3405aff39e12ebc5306f98521737d923b87f')

pkgver() {
  echo "$pkgver"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
