# Maintainer: munsternet <munsternet at ik dot me>
_pkgname=trackaudio
pkgname=trackaudio-bin
pkgver=1.3.3
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
b2sums=('3cd5d1eb6dd655f6d9884c68177b19dc14899b375bc630989bf704c1f81391acb93f8770b420af479b0358c817ddd9107e09b549f56d6d845f6b0400c7e4ec8f')

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir/"

    # Keep a symlink in /usr/bin for backwards compatibility
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "${pkgdir}/opt/TrackAudio/trackaudio" "${pkgdir}/usr/bin/trackaudio"
}
