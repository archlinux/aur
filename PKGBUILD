# Maintainer Adrian Woźniak <adrian.wozniak@ita-prog.pl>

pkgbase=amdmond-bin
pkgname=amdmond-bin
pkgver=1.0.10
pkgrel=2
pkgdesc="AMDGPU temperature and fan speed monitoring tool"
url="https://github.com/Eraden/amdgpud"
license=('MIT' 'Apache-2.0')
source=( "https://github.com/Eraden/amdgpud/releases/download/v0.1.0.10/amdmond.tar.gz")
arch=('x86_64')
md5sums=( '727f94b2decde6a45e7bd5bbe6a62e19')
keywords=( 'amdgpu' 'controller' 'fan', 'overclocking', 'voltage')
optdepends=('amdfand-bin' 'amdguid-glow-bin' 'amdguid-wayland-bin' 'amdvold-bin')

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
