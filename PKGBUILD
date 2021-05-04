# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=realvnc-vnc-viewer-aarch64
pkgver=6.20.530.42683
pkgrel=1
pkgdesc='VNC remote desktop client software by RealVNC - aarch64 version from Raspbian repos'
arch=('aarch64')
url='https://www.realvnc.com/'
license=('custom')
depends=('libsm' 'libxext')
conflicts=('tightvnc' 'tigervnc' 'turbovnc' 'realvnc-vnc-viewer')
provides=('realvnc-vnc-viewer')
source=("http://archive.raspberrypi.org/debian/pool/main/r/realvnc-vnc/realvnc-vnc-viewer_${pkgver}_arm64.deb")
sha256sums=('5cafc1aed06ef6c0b1b8d6f581b9819bc3b0538b0d22ae40d7a6b88bbc6aae39')

package() {
    bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
    install -D "$pkgdir/usr/share/doc/realvnc-vnc-viewer/copyright" "$pkgdir/usr/share/licenses/realvnc-vnc-viewer/LICENSE"
}
