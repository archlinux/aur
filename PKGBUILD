# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
_watch=('https://www.realvnc.com/en/connect/download/viewer/linux/' 'VNC-Viewer-(\d[\d.]*\d+)-Linux-x64\.deb')

pkgname=realvnc-vnc-viewer
pkgver=6.21.920
pkgrel=1
pkgdesc='VNC remote desktop client software by RealVNC'
arch=('x86_64' 'i686' 'armv7h')
url='https://www.realvnc.com/'
license=('custom')
depends=('libsm' 'libxext')
conflicts=('tightvnc' 'tigervnc' 'turbovnc')
source_x86_64=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-x64.deb")
source_i686=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-x86.deb")
source_armv7h=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-ARM.deb")
sha1sums_x86_64=('8be6694efef8522f1bde5816d74d07d200244e47')
sha1sums_i686=('6c8377bff35079dee1511224256d2841aea2be47')
sha1sums_armv7h=('14965df389a36fe19239aff2ab73377c08eca789')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
