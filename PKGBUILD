# Maintainer: BinaryHarbinger <halilefeesen@proton.me>

_pkgauthor=BinaryHarbinger
_pkgname=walker

pkgname=${_pkgname}-binarydots-bin
pkgver=1.0.0
pkgrel=1
_pkgvername=v${pkgver}

pkgdesc='wayland application runner patched for binarydots'

arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL-3.0')

provides=("${pkgname%-binarydots}")
conflicts=("${pkgname%-binarydots}")
depends=('glibc' 'gcc-libs' 'glib2' 'gtk4' 'gtk4-layer-shell' 'poppler-glib' 'cairo' 'elephant')
optdepends=('elephant-all: elephant + all official elephant providers')

options=(!strip)

# Binary + license + readme
source=("https://github.com/${_pkgauthor}/${_pkgname}/releases/download/${_pkgvername}/walker"
        "https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}/LICENSE"
        "https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}/README.md")

sha256sums=('a52092c2ea3175043782715dd17f166d4485013dc83f7782be8edfdbb3eb26a5'
            'SKIP'
            'SKIP')

package() {
    cd "${srcdir}" || exit 1

    # Binary
    install -Dm755 "walker" "${pkgdir}/usr/bin/walker"

    # License ve README
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
