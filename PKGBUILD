# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Eli schwartz <eschwartz@archlinux.org>

pkgname=librewolf-extension-noscript
pkgver=11.2.3
pkgrel=1
_file=3715504
pkgdesc="Extension for Librewolf which disables javascript"
arch=('any')
url="https://noscript.net/"
license=('GPL2')
groups=('librewolf-addons')
makedepends=('unzip')
source=("noscript-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/${_file}/")
noextract=("noscript-${pkgver}.xpi")
sha256sums=('4258bcd0bcdfc8ecb231d250e3adf1c477a1a672ede74a5cd10ba05a5381babb')
b2sums=('ef34820c9e839c0eb8f1ed10c30c907d2eae1e1029dbc30c63a6f866969c99982c889a00995daf4f6df9f081a362070a6753215b101145cc1bf41dfba99051a6')

package() {
  depends=('librewolf')
  _extension_id="{73a6fe31-595d-460b-a920-fcc0f8843232}"
  _extension_dest="${pkgdir}/usr/lib/librewolf/browser/extensions/${_extension_id}"
  install -Dm644 noscript-${pkgver}.xpi "${_extension_dest}.xpi"
}
