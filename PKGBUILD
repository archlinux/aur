# Maintainer: Brandon Mulcahy <brandon@jangler.info>
pkgname=schematic
pkgver=1.0.0
pkgrel=1
pkgdesc="Create a color scheme based on a seed RGB color value"
arch=('any')
url="http://jangler.info/code/schematic"
license=('MIT')
depends=()
source=("https://github.com/jangler/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4bcdda1b43b0dd79f3fe2089925c9c1e4f71fb9f89d600f91f5045f8413ea83c')

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
