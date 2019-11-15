# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
pkgname=netkit
pkgver=2.8
pkgrel=3
epoch=
pkgdesc="The poor man's system to experiment computer networking"
arch=(any)
url="http://wiki.netkit.org/index.php/Download_Official"
license=('unknown')
groups=()
depends=('xterm' 'lsof' 'lib32-glibc')
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
    "netkit.sh")
noextract=( \
    "netkit-filesystem-i386-F5.2.tar.bz2" \
    "netkit-2.8.tar.bz2" \
    "netkit-kernel-i386-K2.8.tar.bz2")
sha256sums=( \
    "476d9212897246878803642b14cb0210c9f112250e65a75da8c5fd2309242588" \
    "eb0544a69a57a188cf853452414a38c5000e0bc643305c25b628967fc86aa696" \
    "0106b9ac0c6ccda756455b6e5d38d2845b8380ae0db7b7a8f44304c24c9694ac" \
    "56ec57522b8deaf75db6318e45e64102eb30329c687aa99ef4fdc2c7285b6be4")
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
    mkdir -p "$pkgdir/usr/bin"
    cp netkit.sh "$pkgdir/usr/bin/netkit"
}
