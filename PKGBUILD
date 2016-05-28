#Maintainer: allencch <allencch at hotmail dot com>
pkgname=selektor
_minor=65
pkgver=3.13.${_minor}
pkgrel=1
pkgdesc="Tor launcher and exit node chooser"
arch=('any')
depends=('tor' 'java-environment')
url="http://www.dazzleships.net/?page_id=71"
license=('GPL2')
source=("${pkgname}-${pkgver%.${_minor}}-${_minor}_all.tar.gz::http://www.dazzleships.net/?wpdmact=process&did=My5ob3RsaW5r")
sha256sums=('af51abed504f8e088dee0f13ac30bcfa3f5188217b332044aefb98de06932b15')

package() {
  destfolder="${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share"
  mkdir -p "$destfolder"

  cd ${srcdir}/${pkgname}-${pkgver%.${_minor}}.${_minor}_all

  cp opt "${pkgdir}" -rf
  cp applications man "${pkgdir}/usr/share" -rf
  cp "${pkgname}" "${pkgdir}/usr/bin" -rf
}
