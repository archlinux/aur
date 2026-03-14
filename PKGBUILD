# Maintainer: vcup <me@vcup.moe>
pkgname=shoko-webui
pkgver=2.5.4
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
sha512sums=('3904070d29e71ee250dcb23b3f0dc77a8d4fd48e81a7e41d9bbd99b89c656ca73c45a9b21ba9a3ab9d9dfc687c42b5372248eb871d0d86950913c3698e507a65')

package() {
  install -d "${pkgdir}/usr/lib/shoko/webui"
  unzip "${srcdir}/${pkgname}-${pkgver}.zip" -d $_
  mv "$_/index.html" "${pkgdir}/usr/lib/shoko/webui/index.html.fulfil"
}

