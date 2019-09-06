# Maintainer: "Von Random" <von@vdrandom.org>

pkgname=tamtam
pkgver=1.1.22
pkgrel=1
pkgdesc='TamTam messenger for linux'
arch=('x86_64')
url='https://desktop.tamtam.chat/latest/'
license=('custom')
depends=('alsa-lib' 'gconf' 'gtk2' 'libsecret' 'libxss' 'libxtst' 'nss')
source=("${pkgname}-${pkgver}.deb::https://desktop.tamtam.chat/v${pkgver}/TamTam-amd64.deb")
sha256sums=('6f4e69940558bd12727433af08d21c41519a5e2ebd6e27ce3dfff2d04cffbcfb')
package() {
  cd "${srcdir}"
  tar -xJC "${pkgdir}" -f data.tar.xz
  mkdir "${pkgdir}/usr/bin"
  ln -s "/opt/TamTam/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
