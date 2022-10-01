# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
_watch=('https://www.realvnc.com/en/connect/download/viewer/linux/' 'VNC-Viewer-(\d[\d.]*\d+)-Linux-x64\.deb')

pkgname=realvnc-vnc-viewer
pkgver=6.22.826
pkgrel=1
pkgdesc='VNC remote desktop client software by RealVNC'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://www.realvnc.com/'
license=('custom')
depends=('libsm' 'libxext')
conflicts=('tightvnc' 'tigervnc' 'turbovnc')
source_x86_64=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-x64.deb")
source_i686=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-x86.deb")
source_armv7h=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-ARM.deb")
source_aarch64=("https://www.realvnc.com/download/file/viewer.files/VNC-Viewer-${pkgver}-Linux-ARM64.deb")
sha256sums_x86_64=('f329dd523aee315232afa5c19b8eec7e289df4d8e184b3be4c8f1dd2d1b34ea4')
sha256sums_i686=('9df8a47f6823e973aca391392d045f715fbefd4eb4dd3a1a26428ef823ac9ed5')
sha256sums_armv7h=('b41ed8a04d8ca2b435f4f7c06586c69ab6350699d955a41b938de4bd3b26594b')
sha256sums_aarch64=('92f4ae583bfa583a8f06895c6d9b08384cb3b7ef89dfdf0566fc2a67989de4f8')

package() {
    bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.xz"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
