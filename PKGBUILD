# Maintainer: JP-Ellis <coujellis@gmail.com>

pkgname=arxiv-open
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple script and desktop entry to handle arXiv links."
url="http://github.com/JP-Ellis/arxiv-open"
arch=('any')
license=('MIT')
depends=()
source=("arxiv-open"
        "arxiv-open.desktop"
        "LICENSE")
sha256sums=('76fc429d4b9e267094f99c7cdb58feec6f8cd6b1395069dd72db28571d7c384e'
            '199f8e78bc538f5b006329be43f6932c27c0c437344c351bb9ee4eb3a9ac9ee1'
            '16157e0292310978360f4cdc134fdec7207312320c99264f03901921fbfdbfa2')

package() {
  install -Dm644 "${srcdir}/arxiv-open.desktop" "${pkgdir}/usr/share/applications/arxiv-open.desktop"
  install -Dm755 "${srcdir}/arxiv-open" "${pkgdir}/usr/bin/arxiv-open"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
    type update-desktop-database && update-desktop-database -q
}

post_remove() {
    type update-desktop-database && update-desktop-database -q
}

# Local Variables:
# mode: sh
# End:
