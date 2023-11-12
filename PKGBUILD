# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
_watch=('https://www.realvnc.com/en/connect/download/viewer/linux/' 'VNC-Viewer-(\d[\d.]*\d+)-Linux-x64\.deb')

pkgname=realvnc-vnc-viewer
pkgver=7.8.0
pkgrel=1
pkgdesc='VNC remote desktop client software by RealVNC'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://www.realvnc.com/'
license=('custom')
depends=('libsm' 'libxext')
conflicts=('tightvnc' 'tigervnc' 'turbovnc')
source_x86_64=("https://downloads.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-x64.deb")
source_armv7h=("https://downloads.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-ARM.deb")
source_aarch64=("https://downloads.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-ARM64.deb")
sha256sums_x86_64=('751e1c3110ccb232b2ac11f6d0a639a2506d291e785f8596024be8e4cc5a49b2')
sha256sums_armv7h=('29a0eca312051675f77cbbead08af062f5dabd5b131e0bb37f57372357013c2a')
sha256sums_aarch64=('dd421ed429d7f037028c44a1f6a823962b1317861e7b8b8ef7249cd29436b2c7')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
