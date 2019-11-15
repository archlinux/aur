# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
pkgname=netkit
pkgver=2.8
pkgrel=1
epoch=
pkgdesc="The poor man's system to experiment computer networking"
arch=(any)
url="http://wiki.netkit.org/index.php/Download_Official"
license=('unknown')
groups=()
depends=('xterm' 'lsof')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=netkit.install
changelog=
source=(
    "http://wiki.netkit.org/download/netkit-filesystem/netkit-filesystem-i386-F5.2.tar.bz2" \
    "http://wiki.netkit.org/download/netkit/netkit-2.8.tar.bz2" \
    "http://wiki.netkit.org/download/netkit-kernel/netkit-kernel-i386-K2.8.tar.bz2" \
    "init-netkit.sh" \
    "init-netkit")
noextract=( \
    "netkit-filesystem-i386-F5.2.tar.bz2" \
    "netkit-2.8.tar.bz2" \
    "netkit-kernel-i386-K2.8.tar.bz2")
sha256sums=( \
    "476d9212897246878803642b14cb0210c9f112250e65a75da8c5fd2309242588" \
    "eb0544a69a57a188cf853452414a38c5000e0bc643305c25b628967fc86aa696" \
    "0106b9ac0c6ccda756455b6e5d38d2845b8380ae0db7b7a8f44304c24c9694ac" \
    "b2da34ca5461fc0f9c154b846be27245759046b7f79fb4cb0b0ed99e200a6766" \
    "82ec28316dfdb587c7832385cb08305bf43b75485c00d3057dc14c77928962c5")
validpgpkeys=()

prepare() {
    echo "Extracting netkit-filesystem-i386-F5.2.tar.bz2"
    tar -jSxf netkit-filesystem-i386-F5.2.tar.bz2
    echo "Extracting netkit-2.8.tar.bz2"
    tar -jSxf netkit-2.8.tar.bz2
    echo "Extracting netkit-kernel-i386-K2.8.tar.bz2"
    tar -jSxf netkit-kernel-i386-K2.8.tar.bz2
}

package() {
    mkdir -p "$pkgdir/opt"
    mv netkit "$pkgdir/opt/"
    cp init-netkit.sh "$pkgdir/opt/netkit/"
    mkdir -p "$pkgdir/usr/bin"
    cp init-netkit "$pkgdir/usr/bin/"
}
