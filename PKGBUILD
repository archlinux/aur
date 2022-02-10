# Maintainer Adrian Woźniak <adrian.wozniak@ita-prog.pl>

pkgbase=amdmond-bin
pkgname=amdmond-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="AMDGPU temperature and fan speed monitoring tool"
url="https://github.com/Eraden/amdgpud"
license=('MIT' 'Apache-2.0')
source=( "https://github.com/Eraden/amdgpud/releases/download/v${pkgver}/amdmond.tar.gz")
arch=('x86_64')
md5sums=( 'b31b27810eca232bf4bb457e14be3d1c')
keywords=( 'amdgpu' 'controller' 'fan', 'overclocking', 'voltage')
optdepends=('amdfand' 'amdguid' 'amdvold')

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