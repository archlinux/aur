# Maintainer: vcup <me@vcup.moe>
pkgname=shoko-webui
_basever=2.3.0
_pkgver_postfix=dev.6
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
sha512sums=('a1674881278406a30440eef64b94e64c23f5b4565fb3375ca4d6593789d06e7e03deabb806a1a49afda82bd957d6170f1a943a57ba7294e9aef57640e7399f9c')

package() {
  install -d "${pkgdir}/usr/lib/shoko/webui"
  unzip "${srcdir}/${pkgname}-${pkgver_full}.zip" -d $_
  mv "$_/index.html" "${pkgdir}/usr/lib/shoko/webui/index.html.fulfil"
}

