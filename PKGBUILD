# Maintainer Adrian Woźniak <adrian.wozniak@ita-prog.pl>

pkgbase=amdmond-bin
pkgname=amdmond-bin
pkgver=1.0.8
pkgrel=1
pkgdesc="AMDGPU voltage management tool"
url="https://github.com/Eraden/amdgpud"
license=('MIT' 'Apache-2.0')
source=( "https://github.com/Eraden/amdgpud/releases/download/v${pkgver}/amdmond.tar.gz")
arch=('x86_64')
md5sums=( '648ce81db62476f44836448ee726f814')
keywords=( 'amdgpu' 'controller' 'fan', 'overclocking', 'voltage')

build() {
    cd $srcdir/
    tar -xvf $srcdir/amdmond.tar.gz
}

package() {
    cd $srcdir/
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/lib/systemd/system/
    install -m 0755 $srcdir/amdmond $pkgdir/usr/bin
    install -m 0755 $srcdir/amdmond.service "$pkgdir/usr/lib/systemd/system/amdmond.service"
}

#vim: syntax=sh