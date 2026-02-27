# Maintainer: vcup <me@vcup.moe>
pkgname=shoko-webui
pkgver=2.5.2
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
sha512sums=('80fa0cbe49876579dc30a92840229f7de32d994c781432221ce0fe51412331a03b6b9a72bcfe56ca6926a3cfa1a6cc8d102568538b754496c0667da8a62bfe25')

package() {
  install -d "${pkgdir}/usr/lib/shoko/webui"
  unzip "${srcdir}/${pkgname}-${pkgver}.zip" -d $_
  mv "$_/index.html" "${pkgdir}/usr/lib/shoko/webui/index.html.fulfil"
}

