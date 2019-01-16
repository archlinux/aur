# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
_watch=('https://www.realvnc.com/en/connect/download/viewer/linux/' 'VNC-Viewer-(\d[\d.]*\d+)-Linux-x64\.deb')

pkgname=realvnc-vnc-viewer
pkgver=6.19.107
pkgrel=1
pkgdesc='VNC remote desktop client software by RealVNC'
arch=('x86_64' 'i686')
url='https://www.realvnc.com/'
license=('custom')
depends=('libsm' 'libxext')
conflicts=('tightvnc' 'tigervnc' 'turbovnc')
source_x86_64=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-x64.deb")
source_i686=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-x86.deb")
sha1sums_x86_64=('4c4ff9c7a7647115d2078c2819e7539eeb9c1039')
sha1sums_i686=('f728505b119f4605db44456bb9d1ba5893d763b3')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
