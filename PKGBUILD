# Maintainer: vcup <me@vcup.moe>
pkgname=shoko-webui
pkgver=2.2.1
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
sha512sums=('e3bf3bf673b0b4b748298b67d331bad3bd106ed07f9a9429cb1b31d1df211aeaee121ae1a49b25d9fcfd4e11620e8a803029c97ca5f86870336cabfd4f78463e')

package() {
  install -d "${pkgdir}/usr/lib/shoko/webui"
  unzip "${srcdir}/${pkgname}-${pkgver}.zip" -d $_
  mv "$_/index.html" "${pkgdir}/usr/lib/shoko/webui/index.html.fulfil"
}

