# Maintainer: Efe Esen <sorashii@proton.me>

_pkgauthor=sorashii
_pkgname=riftbar

pkgname=${_pkgname}-bin
pkgver=0.3.0
pkgrel=1
_pkgvername=v${pkgver}

pkgdesc='Highly customizable GTK4 bar for Wayland written in Rust'

arch=('x86_64')
url="https://codeberg.org/${_pkgauthor}/${_pkgname}"
license=('GPL-3.0')

provides=("riftbar")
conflicts=("riftbar")
depends=(
  'gtk4'
  'gtk4-layer-shell'
  'wayland'
)

# Binary + license + readme
source=(
  "riftbar::https://codeberg.org/${_pkgauthor}/${_pkgname}/releases/download/${_pkgvername}/riftbar-x86_64"
  "LICENSE::https://codeberg.org/${_pkgauthor}/${_pkgname}/raw/tag/${_pkgvername}/LICENSE"
  "README.md::https://codeberg.org/${_pkgauthor}/${_pkgname}/raw/tag/${_pkgvername}/README.md"
)

options=(!debug)

sha256sums=('6b33ffaaa8e9c3102eb442e7b3543e19a665dd1471904de407037babd4280328'
            'SKIP'
            'SKIP')

package() {
    cd "${srcdir}" || exit 1

    # Binary
    install -Dm755 "riftbar" "${pkgdir}/usr/bin/riftbar"

    # License ve README
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
