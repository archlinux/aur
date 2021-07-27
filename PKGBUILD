# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Eli schwartz <eschwartz@archlinux.org>

pkgname=librewolf-extension-noscript
pkgver=11.2.10
pkgrel=2
_file=3750385
pkgdesc="Extension for Librewolf which disables javascript"
arch=('any')
url="https://noscript.net/"
license=('GPL2')
groups=('librewolf-addons')
makedepends=('unzip')
source=("noscript-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/${_file}/")
noextract=("noscript-${pkgver}.xpi")
sha256sums=('278ee526d7c3ce5236c1a04aa5b6605c81b82399b846e43cdf6f93f11fef1ec9')
b2sums=('938ce606aba39274d4f6ea1aa40c129deb54ac3a412c185b0b46842179c45d357d30a02f24a78e557b885741a8a741c7e717894305b4c88022c8746768316518')

package() {
  depends=('librewolf')
  _extension_id="{73a6fe31-595d-460b-a920-fcc0f8843232}"
  _extension_dest="${pkgdir}/usr/lib/librewolf/browser/extensions/${_extension_id}"
  install -Dm644 noscript-${pkgver}.xpi "${_extension_dest}.xpi"
}
