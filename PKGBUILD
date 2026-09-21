# Maintainer: Etienne Charland <mysteryx93 at protonmail dot com>
# AviSynth AVSI only. VapourSynth already has vapoursynth-plugin-xclean-git on the AUR.

pkgname=avisynth-plugin-xclean
pkgver=r20260507.5fd5548
pkgrel=1
pkgdesc="AviSynth xClean 3-pass denoiser (AVSI)"
arch=('any')
url='https://github.com/mysteryx93/xClean'
license=('GPL-3.0-only')
depends=('avisynthplus')
optdepends=(
    'avisynth-plugin-mvtools2-pinterf: MVTools2 (pinterf)'
    'avisynth-plugin-masktools2-git: MaskTools2'
)
_commit='5fd5548f5b372932c5901bc2a085cd72a4585d9d'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mysteryx93/xClean/archive/${_commit}.tar.gz")
sha256sums=('f8dd4a0a123d65e066413358f9c1f489fd99decdaf381eff6b6e7b4657617df9')

package() {
    cd "xClean-${_commit}"
    install -Dm644 xClean.avsi "${pkgdir}/usr/lib/avisynth/xClean.avsi"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
