# Maintainer: Etienne Charland <mysteryx93 at protonmail dot com>
# Upstream: Asd-g — https://github.com/Asd-g/AviSynthPlus-RIFE

pkgname=avisynth-plugin-rife-asdg-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="AviSynth+ RIFE frame interpolation (Asd-g, ncnn Vulkan) — prebuilt"
arch=('x86_64')
url='https://github.com/Asd-g/AviSynthPlus-RIFE'
license=('MIT')
depends=('avisynthplus' 'vulkan-icd-loader' 'gcc-libs' 'glibc')
provides=("avisynth-plugin-rife-asdg=${pkgver}")
conflicts=('avisynth-plugin-rife-asdg')
options=('!strip')
# Arch tarball from this repo's rife-asdg-v$pkgver Release (not Ubuntu).
_tarball="avisynth-plugin-rife-asdg-${pkgver}-linux-x86_64-arch.tar.zst"
source=("${_tarball}::https://github.com/mysteryx93/AviSynth-Plugins-AUR/releases/download/rife-asdg-v${pkgver}/${_tarball}")
sha256sums=('cf51ba1f0f9b542f8348a6a1a20825551b695c6d8ef1eb82018cee5d0bdc0b76')

package() {
    install -dm755 "${pkgdir}/usr/lib/avisynth"
    cp -a "${srcdir}/bin/." "${pkgdir}/usr/lib/avisynth/"
}
