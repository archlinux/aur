# Maintainer: vcup <me@vcup.moe>
pkgname=shoko-webui
_basever=2.3.0
_pkgver_postfix=dev.2
pkgver=${_basever}${_pkgver_postfix:+.${_pkgver_postfix}}
#pkgver=2.3.0
pkgver_full=${_basever:-${pkgver}}${_pkgver_postfix:+-${_pkgver_postfix}}
pkgrel=1
pkgdesc='The webui used in Shoko Server.'
arch=('any')
url="https://github.com/Shokoanime/Shoko-WebUI"
depends=('shoko-server')
makedepends=('unzip')
install=${pkgname}.install
source=(
  "${pkgname}-${pkgver_full}.zip::https://github.com/ShokoAnime/Shoko-WebUI/releases/download/v${pkgver_full}/Shoko-WebUI-v${pkgver_full}.zip"
)
noextract=("${pkgname}-${pkgver_full}.zip")
sha512sums=('e24ddb43963c228dddb7da1c0ef55e74b0adc79e4d9fd1d14e7e8aef9b700af43be056e17af808d53007e1328bbba572e1307b5183609d935f67ab5959b459b4')

package() {
  install -d "${pkgdir}/usr/lib/shoko/webui"
  unzip "${srcdir}/${pkgname}-${pkgver_full}.zip" -d $_
  mv "$_/index.html" "${pkgdir}/usr/lib/shoko/webui/index.html.fulfil"
}

