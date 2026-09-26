# Based on zotero-extension-ocr, maintained by Corentin Cadiou <contact@cphyc.me>
pkgname=zotero-extension-scihub
_pkgname=zotero-scihub
pkgver=2.0.0
pkgrel=1
pkgdesc="Download papers and books by DOI from Sci-Hub"
arch=(any)
url="https://github.com/ethanwillis/${_pkgname}"
license=(AGPL-3.0-or-later)
depends=()
makedepends=()
optdepends=()
groups=(zotero-addons)
source=(${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.xpi)
sha512sums=('843e0fe353ccccf47460797330b095dab3e16b7da5fb2bd33ba642937b0b0b64330f1b5e2d9041a2e6d65782f8718b6eba8f9a66787bb12ccf2b60ebf9af3e82')

prepare() {
  # Make sure zotero is not running
  if [[ $(pgrep -c zotero) -gt 0 ]]; then
    echo "Zotero is running, please close it before installing this package."
    exit 1
  fi
}

package() {
  install -Dm 644 ${_pkgname}-${pkgver}.xpi -t "${pkgdir}/usr/lib/zotero/extensions"
}
