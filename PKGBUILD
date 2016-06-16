# Maintainer: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=ayat
pkgver=1.4
pkgrel=1
pkgdesc="Holy Quran - KSU Electronic Moshaf project"
arch=('any')
url="http://quran.ksu.edu.sa/"
license=('GPL')
depends=(adobe-air-sdk lib32-libxt lib32-curl)
makedepends=(unzip)
source=("http://cdn.ksu.edu.sa/quran/ayat/download/programs/Ayat-v${pkgver}_linux.zip" ${pkgname} ${pkgname}.desktop)
noextract=("Ayat-v${pkgver}_linux.zip")
md5sums=(b1fa5ee55415ea3e9228e6f11599206a 
         ad48120862e0767d15968a49420c1a27
         d374c9501d78ce6c9079c66aec4feb15)

prepare() {
  cd "${srcdir}"
  unzip -q "Ayat-v${pkgver}_linux.zip"
}

package() {
  mkdir -p "${pkgdir}/opt/airapps/${pkgname}"
  unzip -q "${srcdir}/Ayat-v${pkgver}.air" -d "${pkgdir}/opt/airapps/${pkgname}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/airapps/${pkgname}/icons/128_app.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
