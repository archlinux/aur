# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=openscad-bosl
pkgver=1.0.3
pkgrel=1
pkgdesc="A library of tools, shapes, and helpers to make OpenScad easier to use."
arch=('any')
url="https://github.com/revarbat/BOSL"
license=('BSD')
depends=(
    'openscad'
)
source=("https://github.com/revarbat/BOSL/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    mv "BOSL-${pkgver}" "BOSL"
}

package() {
    _outdir="${pkgdir}/usr/share/openscad/libraries/"

    find "BOSL" -name '*.scad' -exec install -Dm744 '{}' "${_outdir}/{}" \;
    install -Dm644 "BOSL/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
sha1sums=('ed3e1b56999de79d1d6a9c9537127edb036af6cb')
