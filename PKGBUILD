# Maintainer: Konstantin Shalygin <k0ste@cn.ru>
# Contributor: Konstantin Shalygin <k0ste@cn.ru>

pkgname="firefox-extension-adblock-plus"
pkgver='2.7.3'
pkgrel='1'
pkgdesc='Adblock Plus extension. This is signed package.'
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/adblock-plus"
license=('GPL')
replaces=('firefox-adblock-plus')
depends=('firefox')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/latest/1865/addon-1865-latest.xpi")
sha256sums=('a9f98421d7b4da931fa1fd09796b2ee9bb917ee5049e69f648c8f3584f494112')
noextract=(${source[@]%%::*})

package() {
  pushd "${srcdir}"
  install -Dm644 "${pkgname}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/{d10d0bf8-f5b5-c8b4-a8b2-2b9879e08c5d}.xpi"
  popd
}
