# Maintainer: Etienne Charland <mysteryx93 at protonmail dot com>
# Upstream: pinterf — https://github.com/pinterf/mvtools
# Distinct from classic Fizick MVTools and from vapoursynth-plugin-mvtools.

pkgname=avisynth-plugin-mvtools2-pinterf-bin
pkgver=2.7.47
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
sha256sums=('c0d41742dd3c335cfc1d2de1221d9c82768fe35c00d7b381caca2acdd9dbfaa3')

package() {
    install -dm755 "${pkgdir}/usr/lib/avisynth"
    cp -a "${srcdir}/bin/." "${pkgdir}/usr/lib/avisynth/"
}
