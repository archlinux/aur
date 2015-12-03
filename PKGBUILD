# Maintainer: JP-Ellis <coujellis@gmail.com>

pkgname=doi-open
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple script and desktop entry to handle DOI links."
url="http://github.com/JP-Ellis/doi-open"
arch=('any')
license=('MIT')
depends=()
source=("doi-open"
        "doi-open.desktop"
        "LICENSE")
sha256sums=('f047573b5fd735f37f2e81159675c701e1fa63167f9cf519227e6712467640f9'
            'e68a88da9ba901a7280fd9a24d0baa3b75aab5feafe94bc51007d99f36c4edd7'
            '16157e0292310978360f4cdc134fdec7207312320c99264f03901921fbfdbfa2')

package() {
  install -Dm644 "${srcdir}/doi-open.desktop" "${pkgdir}/usr/share/applications/doi-open.desktop"
  install -Dm755 "${srcdir}/doi-open" "${pkgdir}/usr/bin/doi-open"
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
