# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
_watch=('https://www.realvnc.com/en/connect/download/viewer/linux/' 'VNC-Viewer-(\d[\d.]*\d+)-Linux-x64\.deb')

pkgname=realvnc-vnc-viewer
pkgver=6.22.315
pkgrel=1
pkgdesc='VNC remote desktop client software by RealVNC'
arch=('x86_64' 'i686' 'armv7h')
url='https://www.realvnc.com/'
license=('custom')
depends=('libsm' 'libxext' 'libxcrypt-compat')
conflicts=('tightvnc' 'tigervnc' 'turbovnc')
source_x86_64=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-x64.deb")
source_i686=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-x86.deb")
source_armv7h=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-ARM.deb")
sha1sums_x86_64=('6e3fd8e5ed6c79943d91db9ebea3c85e915cc522')
sha1sums_i686=('475734caea3694b638567ee8551a7f09f668fd45')
sha1sums_armv7h=('463a76c7a465c8642ebc924611db0360cdc3c885')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
