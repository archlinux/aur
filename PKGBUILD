# Maintainer: Kaleb <vitor.guttler@edu.pucrs.br>
pkgname=librewolf-extension-kagisearch-bin
_extname=kagisearch
# renovate: datasource=custom.amo depName=kagisearch
pkgver=0.7.8
pkgrel=1
pkgdesc="Kagi Search browser extension for LibreWolf"
arch=('any')
url="https://kagi.com/search"
license=('custom')
depends=('librewolf')
_file_id="kagisearch-${pkgver}.xpi"
source=("${_file_id}::https://addons.mozilla.org/firefox/downloads/file/5244301/kagisearch-${pkgver}.xpi")
sha256sums=('8ef7beb36edecbac778cfb20cb630ce4fb28e67661db0367a06b6726759e9430')
noextract=("${_file_id}")

package() {
    # Install the extension to LibreWolf's distribution extensions directory
    install -Dm644 "${_file_id}" \
        "${pkgdir}/usr/lib/librewolf/distribution/extensions/{e24cb0c4-c472-4eff-a950-13985f5b4b0a}.xpi"
}
