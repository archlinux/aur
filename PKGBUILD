# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=firefox-theme-materia-gray
pkgver=1.0
pkgrel=1
pkgdesc='Firefox theme Materia Gray'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/materia-gray/'
license=('CC-BY-NC-SA-4.0')
depends=('firefox')
makedepends=('jq')
source=("https://addons.mozilla.org/firefox/downloads/file/4598227/materia_gray-${pkgver}.xpi")
sha256sums=('5c328355a15021d6977fe18c37b31937e27547da675644e1151bee978b324ab7')

package() {
  install -D -m0644 "materia_gray-${pkgver}.xpi" "${pkgdir}"/usr/lib/firefox/browser/extensions/"$(jq --raw-output '.browser_specific_settings.gecko.id' < manifest.json)".xpi
}
