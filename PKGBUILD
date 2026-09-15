# Maintainer: Etienne Charland <mysteryx93 at protonmail dot com>
# AviSynth AVSI only. VapourSynth already has vapoursynth-plugin-xclean-git on the AUR.

pkgname=avisynth-plugin-xclean
pkgver=0.10
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
_commit='c50de272c6c8b90a97716523366f5d16054ae4f7'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mysteryx93/xClean/archive/${_commit}.tar.gz")
sha256sums=('a58d7b00eecaa66719606285ff17e3604eae56bccf88d862041eb9dd33c03c95')

package() {
    cd "xClean-${_commit}"
    install -Dm644 xClean.avsi "${pkgdir}/usr/lib/avisynth/xClean.avsi"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
