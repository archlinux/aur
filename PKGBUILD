# Based on zotero-extension-ocr, maintained by Corentin Cadiou <contact@cphyc.me>
pkgname=zotero-extension-scihub
_pkgname=zotero-scihub
pkgver=1.4.4
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
sha512sums=('46ecf21057df781e95a3776924d6dea5620cf02e92a4371a0051939e7d8f9eba5f83f1d5f19e70c186eb669c45a6401629bc667137a538f13b68623132f89c8e')

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
