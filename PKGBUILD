# Maintainer: munsternet <munsternet at ik dot me>
_pkgname=trackaudio
pkgname=trackaudio-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Next-generation cross-platform Audio-For-VATSIM ATC Client"
arch=('x86_64')
url="https://github.com/pierr3/TrackAudio"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}-git")
depends=()
options=(!debug)
source=("https://github.com/pierr3/TrackAudio/releases/download/${pkgver//_/-}/${_pkgname}_${pkgver//_/-}_amd64.deb")
b2sums=('c61c7ddedf4d8d0bdc6b6948c63bf9564de381ee6652993b8725b1c3151f4a1c5a2d272888301c23e9978416721ba95506837681fcb58a9912053130ff58187a')

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir/"

    # Keep a symlink in /usr/bin for backwards compatibility
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "${pkgdir}/opt/TrackAudio/trackaudio" "${pkgdir}/usr/bin/trackaudio"
}
