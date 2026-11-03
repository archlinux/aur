# Based on zotero-extension-ocr, maintained by Corentin Cadiou <contact@cphyc.me>
pkgname=zotero-extension-scihub
_pkgname=zotero-scihub
pkgver=2.0.1
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
sha512sums=('7a78876221f52149a3069c1c154cb48ce9997870b3949812cfaafcfefe10523ae0c3d3ba0af68c35c16525d7a46a2d8f6774c8b5b3a4e1c53c47e36ebe524a0a')

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
