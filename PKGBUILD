# Maintainer: Etienne Charland <mysteryx93 at protonmail dot com>
# Upstream: pinterf — https://github.com/pinterf/mvtools
# Distinct from classic Fizick MVTools and from vapoursynth-plugin-mvtools.

pkgname=avisynth-plugin-mvtools2-pinterf-bin
pkgver=2.7.49
pkgrel=1
pkgdesc="AviSynth+ MVTools2 (pinterf) — prebuilt"
arch=('x86_64')
url='https://github.com/pinterf/mvtools'
license=('GPL-2.0-only')
depends=('avisynthplus' 'fftw' 'gcc-libs' 'glibc')
provides=("avisynth-plugin-mvtools2-pinterf=${pkgver}")
conflicts=('avisynth-plugin-mvtools2-pinterf')
options=('!strip')
# Arch tarball from this repo's mvtools2-pinterf-v$pkgver Release (not Ubuntu).
_tarball="avisynth-plugin-mvtools2-pinterf-${pkgver}-linux-x86_64-arch.tar.zst"
source=("${_tarball}::https://github.com/mysteryx93/AviSynth-Plugins-AUR/releases/download/mvtools2-pinterf-v${pkgver}/${_tarball}")
sha256sums=('7d20edd6176ddfad357bacf77f926e865d7af8731b877e0ad1d71d17b9eb5685')

package() {
    install -dm755 "${pkgdir}/usr/lib/avisynth"
    cp -a "${srcdir}/bin/." "${pkgdir}/usr/lib/avisynth/"
}
