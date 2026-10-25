# Maintainer: Felipe BF <fprgw32 at gmail dot com>

pkgbase=ttf-kreativekorp-urbanrenewal
pkgname=(
    'ttf-kreativekorp-urbanrenewal-athene'
    'ttf-kreativekorp-urbanrenewal-liverpool'
    'ttf-kreativekorp-urbanrenewal-losaltos'
    'ttf-kreativekorp-urbanrenewal-parcplace'
    'ttf-kreativekorp-urbanrenewal-sanfrisco'
    'ttf-kreativekorp-urbanrenewal-torrance'
    'ttf-kreativekorp-urbanrenewal-valencia'
)
pkgver=2011.01
pkgrel=2
pkgdesc="KreativeKorp's set of city-named fonts from Mac OS Classic, not seen since System 7.1, and converted to TrueType format: Athene (Athens), Liverpool (London), Los Altos (Los Angeles), Parc Place (Cream, Creamy, or Palo Alto), Sanfrisco (San Francisco), Torrance (Toronto), and Valencia (Venice)."
arch=('any')
url='https://www.kreativekorp.com/software/fonts/urbanrenewal/'
license=('custom:relay-fonts-1.2f')
depends=('xorg-fonts-encodings')
conflicts=('ttf-petme')

DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -A Mozilla -o %o %u')

source=(
    'urbanrenewal.zip::https://www.kreativekorp.com/swdownload/fonts/urban/urbanrenewal.zip'
)
sha256sums=(
    '8eafc0da14daffd419603cf01c9984eaf26878915a77fa87a999946e87f755cf'
)

_install_font() {
    local fontspec="$1"
    
    install -d "${pkgdir}/usr/share/fonts/${pkgbase}/"

    find "${srcdir}" -type f -name "${fontspec}" \
        -exec install -m644 {} "${pkgdir}/usr/share/fonts/${pkgbase}/" \;

    install -Dm644 "${srcdir}/ReadMe.pdf" "${pkgdir}/usr/share/doc/${pkgname}/ReadMe.pdf"
    install -Dm644 "${srcdir}/FreeLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-kreativekorp-urbanrenewal-athene() {
    pkgdesc="KreativeKorp's Urban Renewal font: Athene, the TrueType version of Athens."

    _install_font 'Athene*.ttf'
}

package_ttf-kreativekorp-urbanrenewal-liverpool() {
    pkgdesc="KreativeKorp's Urban Renewal font: Liverpool, the TrueType version of London."

    _install_font 'Liverpool*.ttf'
}

package_ttf-kreativekorp-urbanrenewal-losaltos() {
    pkgdesc="KreativeKorp's Urban Renewal font: Los Altos, the TrueType version of Los Angeles."

    _install_font 'Los Altos*.ttf'
}

package_ttf-kreativekorp-urbanrenewal-parcplace() {
    pkgdesc="KreativeKorp's Urban Renewal font: Parc Place, the TrueType version of Cream, Creamy, or Palo Alto."

    _install_font 'Parc Place*.ttf'
}

package_ttf-kreativekorp-urbanrenewal-sanfrisco() {
    pkgdesc="KreativeKorp's Urban Renewal font: Sanfrisco, the TrueType version of San Francisco."

    _install_font 'Sanfrisco*.ttf'
}

package_ttf-kreativekorp-urbanrenewal-torrance() {
    pkgdesc="KreativeKorp's Urban Renewal font: Torrance, the TrueType version of Toronto."

    _install_font 'Torrance*.ttf'
}

package_ttf-kreativekorp-urbanrenewal-valencia() {
    pkgdesc="KreativeKorp's Urban Renewal font: Valencia, the TrueType version of Venice."

    _install_font 'Valencia*.ttf'
}

