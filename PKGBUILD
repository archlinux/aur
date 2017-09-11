# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=realvnc-vnc-viewer
pkgver=6.17.731
pkgrel=1
pkgdesc='VNC remote desktop client software by RealVNC'
arch=('x86_64' 'i686' 'armv7h')
url='https://www.realvnc.com/'
license=('custom')
depends=('glibc' 'gcc-libs' 'libice' 'libsm' 'libx11' 'libxext')
conflicts=('tightvnc' 'tigervnc' 'turbovnc')
source_x86_64=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-x64.deb")
source_i686=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-x86.deb")
source_armv7h=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-ARM.deb")
sha1sums_x86_64=('7c313833e701f1358e325cc43a8aaef9da04be3f')
sha1sums_i686=('9c328727776fe6abf33a9270b5af3a17364a8686')
sha1sums_armv7h=('a2c8b6169a2d843dc4076135c699868c63760d83')
options=(!strip)

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.gz"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
