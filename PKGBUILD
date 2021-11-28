# Maintainer Adrian Woźniak <adrian.wozniak@ita-prog.pl>

pkgbase=amdfand-bin
pkgname=amdfand-bin
pkgver=1.0.7
pkgrel=2
pkgdesc="AMDGPU Fan control service"
url="https://github.com/Eraden/amdgpud"
license=('MIT' 'Apache-2.0')
source=( "https://github.com/Eraden/amdgpud/releases/download/v${pkgver}/build.tar.gz")
arch=('x86_64')
md5sums=( '3ccf31a6312011ed303565c13f6b4c79')
keywords=( 'amdgpu' 'controller' 'fan')

build() {
    cd $srcdir/
    tar -xvf $srcdir/build.tar.gz
}

package() {
    cd $srcdir/
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/lib/systemd/system/
    install -m 0755 $srcdir/amdfand $pkgdir/usr/bin
    install -m 0755 $srcdir/amdfand.service "$pkgdir/usr/lib/systemd/system/amdfand.service"
}

#vim: syntax=sh