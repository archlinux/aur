# Maintainer: Stephanie Hobbs (RX14) <steph@rx14.co.uk>

pkgname=jojodiff
pkgver=0.8.5
pkgrel=1
pkgdesc="Diff utility for binary files"
arch=("x86_64")
url="http://jojodiff.sourceforge.net/"
license=("GPL3")
source=("https://downloads.sourceforge.net/project/jojodiff/jojodiff/jojodiff08/jdiff085.tgz")
sha256sums=('fd10ef977e94b8a4321fb70e2717e448bfa9859a5258a8d0e2bab4430b8aabe8')

prepare() {
    cd jdiff085/src

    #sed -i '/#define ulong unsigned long int/ d' JDefs.h
}

build() {
    cd jdiff085/src

    make
}

package() {
    cd jdiff085/src

    install -m0755 -d "$pkgdir/usr/bin"
    install -m0755 jdiff "$pkgdir/usr/bin"
    cd "$pkgdir/usr/bin"
    ln -sf jdiff jptch
    ln -sf jdiff jpatch
}
