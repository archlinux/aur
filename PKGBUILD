# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Kewl <echo kewl@blto.eu.org | tr b a>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=realvnc-vnc-viewer
pkgver=6.17.1113
pkgrel=1
pkgdesc='VNC remote desktop client software by RealVNC'
arch=('x86_64' 'i686')
url='https://www.realvnc.com/'
license=('custom')
depends=('glibc' 'gcc-libs' 'libice' 'libsm' 'libx11' 'libxext')
conflicts=('tightvnc' 'tigervnc' 'turbovnc')
source_x86_64=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-x64.deb")
source_i686=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-x86.deb")
sha1sums_x86_64=('1873a38269f32711909842bf2d698712653c4675')
sha1sums_i686=('ad9af63f0b2f401f2e4ef20df43cd6164c826a69')
options=(!strip)

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.gz"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
