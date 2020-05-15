# Maintainer: "Von Random" <von@vdrandom.org>

pkgname=tamtam
pkgver=1.1.41
pkgrel=1
pkgdesc='TamTam messenger for linux'
arch=('x86_64')
url='https://desktop.tamtam.chat/latest/'
license=('custom')
depends=('alsa-lib' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss')
source=("${pkgname}-${pkgver}.deb::https://desktop.tamtam.chat/v${pkgver}/TamTam-amd64.deb")
sha256sums=('6314a399dbafd64c069adf116b1549c5b067cfdf14203493b0665679c16fbb6b')
package() {
  cd "${srcdir}"
  tar -xJC "${pkgdir}" -f data.tar.xz
  mkdir "${pkgdir}/usr/bin"
  ln -s "/opt/TamTam/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
