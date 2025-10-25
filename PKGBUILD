# Maintainer: Your Name <your.email@example.com>
pkgname=librewolf-extension-kagisearch-bin
_extname=kagisearch
# renovate: datasource=custom.amo depName=kagisearch
pkgver=1.3.0
pkgrel=1
pkgdesc="Kagi Search browser extension for LibreWolf"
arch=('any')
url="https://kagi.com/search"
license=('custom')
depends=('librewolf')
makedepends=('unzip')
_file_id="kagisearch-${pkgver}.xpi"
source=("${_file_id}::https://addons.mozilla.org/firefox/downloads/file/4368880/kagisearch-${pkgver}.xpi")
sha256sums=('SKIP')
noextract=("${_file_id}")

package() {
    # Install the extension to LibreWolf's distribution extensions directory
    install -Dm644 "${_file_id}" \
        "${pkgdir}/usr/lib/librewolf/distribution/extensions/{e24cb0c4-c472-4eff-a950-13985f5b4b0a}.xpi"
}
