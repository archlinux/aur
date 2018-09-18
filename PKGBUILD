# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
_watch=('https://www.realvnc.com/en/connect/download/viewer/linux/' 'VNC-Viewer-(\d[\d.]*\d+)-Linux-x64\.deb')

pkgname=realvnc-vnc-viewer
pkgver=6.18.907
pkgrel=1
pkgdesc='VNC remote desktop client software by RealVNC'
arch=('x86_64' 'i686')
url='https://www.realvnc.com/'
license=('custom')
depends=('libsm' 'libxext')
conflicts=('tightvnc' 'tigervnc' 'turbovnc')
source_x86_64=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-x64.deb")
source_i686=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-x86.deb")
sha1sums_x86_64=('c8796e07b088f3f2436564219513621dfc142ac6')
sha1sums_i686=('6a762ba453239db1e030b34c11ca2d347137babc')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
