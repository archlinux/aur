# Maintainer: Jérémie Roquet <jroquet@arkanosis.net>
pkgname=binjr-bin
pkgver=3.25.0
pkgrel=1
provides=("binjr")
pkgdesc="Time Series Data Browser"
arch=("x86_64")
url="https://binjr.eu/"
license=("Apache")
source=("https://github.com/binjr/binjr/releases/download/v${pkgver}/binjr-${pkgver}_linux-amd64.tar.gz" "https://github.com/binjr/binjr/releases/download/v${pkgver}/binjr-${pkgver}_linux-amd64.tar.gz.asc")
sha512sums=('SKIP' 'SKIP')
validpgpkeys=("20CAEC83151CCC7CE12DF29EAF45EEEFB23702CB")

prepare() {
    sed -i 's/-Dbinjr.portable=true/-Dbinjr.portable=false/' $srcdir/$pkgver/binjr
    sed -i 's/LINUX_TAR/LINUX_AUR/' $srcdir/$pkgver/binjr
}

package() {
    install -d $pkgdir/{opt/binjr,usr/bin,usr/share/doc/binjr}
    mv $srcdir/$pkgver $pkgdir/opt/binjr
    ln -s /opt/binjr/$pkgver/binjr $pkgdir/usr/bin/binjr
    ln -s /opt/binjr/$pkgver/README.html $pkgdir/usr/share/doc/binjr/README.html
}
