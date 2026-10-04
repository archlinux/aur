# Maintainer: itsflame <post0877@gmail.com>
pkgname=kinopoisk-tv
pkgver=0.1.0
pkgrel=1
pkgdesc="Smart TV интерфейс Кинопоиска на Electron"
arch=('any')
url="https://github.com/itsflameee/kinopoisk-tv"
license=('custom')
depends=('electron')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/itsflameee/kinopoisk-tv/archive/refs/tags/v${pkgver}.tar.gz"
  "kinopoisk-tv.sh"
  "kinopoisk-tv.desktop"
  "kinopoisk-tv.png"
)
sha256sums=('edf7a432c4789635e0fc910fcd16d770df7b11d4c40dd002561c1c3895142894'
            '18d665161251e82ff99299bef9c4b11693fc967401f8198f5ae7cc4f7932d59a'
            'dd9b169b5e95ffb18ef43bf92ff50d20d5e6c26c843709ab5145f6a412bb7991'
            'a75a44afe6aa3313ad2ba385ac8dae28277ed7b9b73547c4a705218060a2ca81')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  install -m 644 "${srcdir}/${pkgname}-${pkgver}/main.js" "${pkgdir}/opt/${pkgname}/main.js"
  install -m 644 "${srcdir}/${pkgname}-${pkgver}/preload.js" "${pkgdir}/opt/${pkgname}/preload.js"
  install -m 644 "${srcdir}/${pkgname}-${pkgver}/package.json" "${pkgdir}/opt/${pkgname}/package.json"

  install -Dm 755 "${srcdir}/kinopoisk-tv.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "${srcdir}/kinopoisk-tv.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  if [ -f "${srcdir}/kinopoisk-tv.png" ]; then
    install -Dm 644 "${srcdir}/kinopoisk-tv.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    install -Dm 644 "${srcdir}/kinopoisk-tv.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  fi
}
