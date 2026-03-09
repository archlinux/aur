# Maintainer: BinaryHarbinger <halilefeesen@proton.me>

_pkgauthor=BinaryHarbinger
_pkgname=riftbar

pkgname=${_pkgname}-bin
pkgver=0.1.8
pkgrel=0
_pkgvername=v${pkgver}

pkgdesc='Highly customizable GTK4 bar for Wayland written in Rust'

arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL-3.0')

provides=("riftbar")
conflicts=("riftbar" "riftbar-git" "riftbar-git-debug")
depends=(
  'gtk4'
  'gtk4-layer-shell'
  'wayland'
)

# Binary + license + readme
source=(
  "riftbar::https://github.com/${_pkgauthor}/${_pkgname}/releases/download/${_pkgvername}/riftbar-x86_64"
  "LICENSE::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}/LICENSE"
  "README.md::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}/README.md"
)


sha256sums=('0daba36a3cff35e704e88dbfcb5f5ca4a9007ae5e0349fd95730f347f1717e98'
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
