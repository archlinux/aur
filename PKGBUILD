# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=xcwd
pkgver=1.0
pkgrel=1
pkgdesc="simple tool that prints the current working directory of the currently focused window"
arch=('i686' 'x86_64')
url="https://github.com/schischi/xcwd"
license=('BSD')
depends=('libx11')
provides=("${pkgname}")
conflicts=("${pkgname}-git")

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('2f43935ccec750abb782d21363b9e999538d901d4c451ab204097c78acd2316f')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Ddm755 "${pkgdir}/usr/bin"

  make prefix="${pkgdir}/usr" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
