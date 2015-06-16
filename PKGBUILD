# Maintainer: Brandon Mulcahy <brandon@jangler.info>
pkgname=moss
pkgver=1.1.0
pkgrel=2
pkgdesc="Mostly orthogonal sequencing server"
arch=('any')
url="http://jangler.info/code/${pkgname}"
license=('MIT')
makedepends=('go')
source=("https://github.com/jangler/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('550f76cf436aae775698c1368a57411fbd43d25aef07209d2022b0531fde296e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -o ${pkgname}
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
