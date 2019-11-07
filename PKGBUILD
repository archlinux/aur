# Maintainer: Stephanie Hobbs (RX14) <steph@rx14.co.uk>

pkgname=jojodiff
pkgver=0.8.1
pkgrel=1
pkgdesc="Diff utility for binary files"
arch=("x86_64")
url="http://jojodiff.sourceforge.net/"
license=("GPL3")
source=("https://downloads.sourceforge.net/project/jojodiff/jojodiff/jojodiff08/jdiff081.tgz")
sha256sums=('8681e503c1d9658a89788d7e4c34c08adce5a0114610cfaaefa32f2bbe613058')

prepare() {
    cd jdiff081/src

    sed -i '/#define ulong unsigned long int/ d' JDefs.h
}

build() {
    cd jdiff081/src

    make
}

package() {
    cd jdiff081/src

    install -m0755 -d "$pkgdir/usr/bin"
    install -m0755 jdiff jptch "$pkgdir/usr/bin"
}
