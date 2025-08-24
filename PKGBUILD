# Maintainer: Network Jack <Network_Jack@null.net>
# Contributor: Marcs <aur (at) mg.odd.red>
# Contributor: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Vinycius Maia <suportevg@uol.com.br>

pkgname=librewolf-extension-greasemonkey
_file=4332091
pkgver=4.13
pkgrel=1
pkgdesc="Customize the way a web page displays or behaves, by using small bits of JavaScript."
arch=('any')
url="http://www.greasespot.net/"
license=('MPL')
makedepends=('jq')
depends=('librewolf>=52.0')
source=("https://addons.mozilla.org/firefox/downloads/file/${_file}/greasemonkey-${pkgver}.xpi")
sha256sums=('31b9e9521eac579114ed20616851f4f984229fbe6d8ebd4dc4799eb48c59578c')

package() {
  cd ${srcdir}
  #local _emid=$(cat manifest.json | jq -r '.applications.gecko.id')|| return 1
  #test ! -z "${_emid}"
  #local _file=(*.xpi)
  #test "${#_file[@]}" -eq 1
  install -Dpm644 "greasemonkey-${pkgver}.xpi" "${pkgdir}/usr/lib/librewolf/browser/extensions/greasemonkey-${pkgver}.xpi"
}

# vim:set ts=2 sw=2 et:
