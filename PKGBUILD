# Maintainer: vcup <me@vcup.moe>
pkgname=shoko-webui
pkgver=2.5.8
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
sha512sums=('bcfbfebbbb1f95a49a88afbea064c46574092fd760713bdda1e436e157c2c512f0adf6a0c1206ee3d799baf8679f5e8ed6554846b470ad057d687fa7aa492840')

package() {
  install -d "${pkgdir}/usr/lib/shoko/webui"
  unzip "${srcdir}/${pkgname}-${pkgver}.zip" -d $_
  mv "$_/index.html" "${pkgdir}/usr/lib/shoko/webui/index.html.fulfil"
}

