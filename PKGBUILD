# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=realvnc-vnc-server-aarch64
pkgver=6.7.2.43081
pkgrel=1
pkgdesc='VNC remote desktop server software by RealVNC - aarch64 version from Raspbian Repos'
arch=('aarch64')
url='https://www.realvnc.com/'
license=('custom')
depends=('libsm' 'libxtst' 'xorg-xauth' 'raspberrypi-userland-aarch64')
optdepends=('cups: Printer support')
install='realvnc-vnc-server-aarch64.install'
conflicts=('tightvnc' 'tigervnc' 'turbovnc' 'realvnc-vnc-server')
provides=('realvnc-vnc-server')
source=("http://archive.raspberrypi.org/debian/pool/main/r/realvnc-vnc/realvnc-vnc-server_${pkgver}_arm64.deb")
sha256sums=('39522bd3931b9ce5ff25d198b45a1c84220edcb2a6ae364851c4942e9cdb3f9c')

package() {
    bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
    install -D "$pkgdir/usr/share/doc/realvnc-vnc-server/copyright" "$pkgdir/usr/share/licenses/realvnc-vnc-server/LICENSE"
    ln -s /opt/vc/lib/libbcm_host.so "$pkgdir/usr/lib/libbcm_host.so.0"
    ln -s /opt/vc/lib/libvcos.so "$pkgdir/usr/lib/libvcos.so.0"
    ln -s /opt/vc/lib/libvchiq_arm.so "$pkgdir/usr/lib/libvchiq_arm.so.0"
}
