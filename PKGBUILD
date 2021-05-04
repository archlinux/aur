# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=realvnc-vnc-server-aarch64
pkgver=6.7.2.43081
pkgrel=1
pkgdesc='VNC remote desktop server software by RealVNC - aarch64 version from Raspbian Repos'
arch=('aarch64')
url='https://www.realvnc.com/'
license=('custom')
depends=('libsm' 'libxtst' 'xorg-xauth')
optdepends=('cups: Printer support')
install='realvnc-vnc-server-aarch64.install'
conflicts=('tightvnc' 'tigervnc' 'turbovnc')
source=("http://archive.raspberrypi.org/debian/pool/main/r/realvnc-vnc/realvnc-vnc-server_${pkgver}_arm64.deb"
                "libbcm_host.so"
                "libvcos.so"
                "libvchiq_arm.so")
sha256sums=('39522bd3931b9ce5ff25d198b45a1c84220edcb2a6ae364851c4942e9cdb3f9c'
            'bfa7a3f00618736f313ae2871948c159013c9058342a3bc56e04096b68568ca0'
            'ac88b83490c44b000c365cb1a5e8dc1dc9a07852a393e12e4b061c7c2eb8ebcd'
            '9727eed77e101149b68d43735e7ecfdedbda664537c2309c3752528125218c75')

package() {
    bsdtar -xv -C "$pkgdir" -f "$srcdir/data.tar.xz"
    install -D "$pkgdir/usr/share/doc/realvnc-vnc-server/copyright" "$pkgdir/usr/share/licenses/realvnc-vnc-server/LICENSE"
    install -D libbcm_host.so "$pkgdir/usr/lib/libbcm_host.so.0"
    install -D libvcos.so "$pkgdir/usr/lib/libvcos.so.0"
    install -D libvchiq_arm.so "$pkgdir/usr/lib/libvchiq_arm.so.0"
}
