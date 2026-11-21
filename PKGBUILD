# Maintainer: Efe Esen <sorashii@proton.me>

_pkgauthor=sorashii
_pkgname=riftbar

pkgname=${_pkgname}-bin
pkgver=0.3.2
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

sha256sums=('7f03ba533a3658711678dd5405765cd33afdd5079dc3abd643068c915a0ce912'
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
