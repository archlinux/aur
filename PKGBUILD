# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=openscad-round-anything
pkgver=1.0.4
pkgrel=1
pkgdesc="A set of OpenSCAD utilities for adding radii and fillets."
arch=('any')
url="https://github.com/Irev-Dev/Round-Anything"
license=('MIT')
depends=(
    'openscad'
)
source=("https://github.com/Irev-Dev/Round-Anything/archive/refs/tags/${pkgver}.tar.gz")

_dirbase="Round-Anything"
build() {
    mv "${_dirbase}-${pkgver}" "${_dirbase}"
}

package() {
    find "${_dirbase}" -name '*.scad' -exec install -Dm744 '{}' "${pkgdir}/usr/share/openscad/libraries/{}" \;
    install -Dm644 "${_dirbase}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
sha1sums=('79b808b8d4624a642808821ca26501ecf49c6722')
