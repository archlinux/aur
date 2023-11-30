# Maintainer: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=gpx-animator
pkgver=1.8.2
pkgrel=1
pkgdesc="Generate a top-down view map video from one or more GPX files"
arch=('any')
url="https://github.com/zdila/gpx-animator"
license=('Apache')
depends=('java-runtime>=1')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.jar"::"https://download.gpx-animator.app/${pkgname}-${pkgver}-all.jar"
        "gpx-animator.sh")
noextract=("${pkgname}-$pkgver.jar")

prepare() {
  cd "${srcdir}"
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --exec "${pkgname}" --categories "Science;DataVisualization"
}

package() {
  install -Dm644 ${pkgname}-$pkgver.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm755 gpx-animator.sh "${pkgdir}/usr/bin/gpx-animator"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
md5sums=('9ff7ef0fc5c83e3ecbbed572291edb92'
         'a9c1115c51482f9ea07f95c2e70359da')
