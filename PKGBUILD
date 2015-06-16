# Maintainer: Brandon Mulcahy <brandon@jangler.info>
pkgname=schematic
pkgver=0.2.1
pkgrel=1
pkgdesc="Create a color scheme based on a seed RGB color value"
arch=('any')
url="https://github.com/jangler/schematic"
license=('MIT')
depends=()
source=("https://github.com/jangler/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8031d1ff472bb7ef34c59395236a740591dbac812d364d3ffcb73ec89e585cd7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 ${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
