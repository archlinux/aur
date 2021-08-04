# Maintainer: GI_Jack <GI_Jack@hackermail.com>

_pkgname=reverse_image_search
pkgname=firefox-extension-${_pkgname}
pkgver=3.3.5
pkgrel=1
_file=3578603
pkgdesc="Context menu to search with an image on various services, such as Google, Bing, Yandex, TinEye, SauceNAO and IQDB"
license=('MPL2')
arch=('any')
url="https://github.com/Brawl345/Image-Reverse-Search-WebExtension"
depends=("firefox")
source=("${_pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/${_file}/bilder_ruckwartssuche_${_pkgname}-${pkgver}-fx.xpi")
noextract=("${_pkgname}-${pkgver}.xpi")
sha256sums=('852f6aab3a770482679b543142357ed4d32cd35f59444f5098a498b78077f590')

package() {
  cd "${srcdir}"
  _extension_id="{0da2e603-21ba-4422-8049-b6d9e013ed84}"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_pkgname}-${pkgver}.xpi "${_extension_dest}.xpi"
}
