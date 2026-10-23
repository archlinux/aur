# Maintainer: vcup <me@vcup.moe>
pkgname=shoko-webui
pkgver=2.5.12
pkgrel=1
pkgdesc='The webui used in Shoko Server.'
arch=('any')
url="https://github.com/Shokoanime/Shoko-WebUI"
depends=('shoko-server')
makedepends=('unzip')
install=${pkgname}.install
source=(
  "${pkgname}-${pkgver}.zip::https://github.com/ShokoAnime/Shoko-WebUI/releases/download/v${pkgver}/Shoko-WebUI-v${pkgver}.zip"
)
noextract=("${pkgname}-${pkgver}.zip")
sha512sums=('9c8a358df68817b2c66a778cf1f1c9fe2f056ec891289145ff2d4c7fef181aec05b9894732d6dc702b2aba974850bd5d1e93c627c9754b2cc8cb3df0d2173cfc')

package() {
  install -d "${pkgdir}/usr/lib/shoko/webui"
  unzip "${srcdir}/${pkgname}-${pkgver}.zip" -d $_
  mv "$_/index.html" "${pkgdir}/usr/lib/shoko/webui/index.html.fulfil"
}

