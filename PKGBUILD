# Maintainer: GI_Jack <GI_Jack@hackermail.com>

_pkgname=reverse_image_search
pkgname=firefox-extension-reverse-image-search
pkgver=3.4.4
pkgrel=1
_file=4074017
pkgdesc="Context menu to search with an image on various services, such as Google, Bing, Yandex, TinEye, SauceNAO and IQDB"
license=('MPL2')
arch=('any')
url="https://github.com/Brawl345/Image-Reverse-Search-WebExtension"
depends=("firefox")
source=("${_pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/${_file}/image_reverse_search_${_pkgname}-${pkgver}.xpi")
noextract=("${_pkgname}-${pkgver}.xpi")
sha256sums=('22c1e735f03d37d64a611bbd6d14b1cb3295a0ce0d91c5eaca3b9ec4a78254a1')

package() {
  cd "${srcdir}"
  _extension_id="{0da2e603-21ba-4422-8049-b6d9e013ed84}"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_pkgname}-${pkgver}.xpi "${_extension_dest}.xpi"
}
