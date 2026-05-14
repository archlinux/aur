# Maintainer: munsternet <munsternet at ik dot me>
_pkgname=trackaudio
pkgname=trackaudio-bin
pkgver=1.4.0_beta.6
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
b2sums=('dff8ebfc575918531027889f2d91f82aab861a98f6db0b66fd233e8589e119d45ec6d4746cbb4440cb35376d442adf7ceb2c7f34881eb9f088aaf944593bea6c')

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir/"

    # Keep a symlink in /usr/bin for backwards compatibility
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "${pkgdir}/opt/TrackAudio/trackaudio" "${pkgdir}/usr/bin/trackaudio"
}
