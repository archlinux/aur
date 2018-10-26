# Maintainer: "Von Random" <von@vdrandom.org>

pkgname=tamtam
pkgver=1.1.6
pkgrel=2
pkgdesc='TamTam messenger for linux'
arch=('x86_64')
url='https://desktop.tamtam.chat/latest/'
license=('custom')
depends=('alsa-lib' 'gconf' 'gtk2' 'libsecret' 'libxss' 'libxtst' 'nss')
source=("${pkgname}-${pkgver}.deb::https://desktop.tamtam.chat/v${pkgver}/TamTam-amd64.deb")
sha256sums=('f245134e3c8091f6b015c1b239a99a1a6c99edf1ea8a0a5fdc504fdab9b971e7')
package() {
  cd "${srcdir}"
  tar -xJC "${pkgdir}" -f data.tar.xz
  mkdir "${pkgdir}/usr/bin"
  ln -s "/opt/TamTam/tamtam-app" "${pkgdir}/usr/bin/tamtam"
}
