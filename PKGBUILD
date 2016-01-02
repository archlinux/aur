# Maintainer: Brandon Mulcahy <brandon@jangler.info>
pkgname=modplay
pkgver=1.1.0
pkgrel=1
pkgdesc="A command-line IT/XM/S3M/MOD player"
arch=('any')
url="http://jangler.info/code/modplay"
license=('MIT')
depends=('dumb' 'portaudio')
source=("https://github.com/jangler/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6f00192cebffa86e7ae1437537d3e158fe6f04e5ee61e722c5983227e8c21099')

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
