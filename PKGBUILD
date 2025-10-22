pkgname=cisco-packettracer
pkgver=900
pkgrel=1
pkgdesc="Cisco Packet Tracer network simulation tool"
arch=('x86_64')
url="https://www.netacad.com/resources/lab-downloads"
license=('propietary')
depends=('qt5-base' 'libx11' 'libxslt' 'libpulse' 'nss')
source=("https://git.kizuren.dev/AUR/cisco-packettracer/src/branch/main/CiscoPacketTracer_${pkgver}_Ubuntu_64bit.deb")
sha256sums=('SKIP')

package() {
    mkdir -p "$srcdir/debextract"
    bsdtar -xf "${srcdir}/PacketTracer_${pkgver}_amd64.deb" -C "$srcdir/debextract"
    tar -xf "$srcdir/debextract/data.tar."* -C "$pkgdir"
}
