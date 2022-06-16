# Maintainer Adrian Woźniak <adrian.wozniak@ita-prog.pl>

pkgbase=amdfand-bin
pkgname=amdfand-bin
pkgver=1.0.13
pkgrel=4
pkgdesc="AMDGPU fan speed management tool"
url="https://github.com/Eraden/amdgpud"
license=('MIT' 'Apache-2.0')
source=( "https://github.com/Eraden/amdgpud/releases/download/v1.0.11/amdfand-1.0.11.tar.gz")
arch=('x86_64')
md5sums=( '799d49fafd429d493c2f6fa158112493')
keywords=( 'amdgpu' 'controller' 'fan', 'overclocking', 'voltage')
optdepends=('amdmond-bin' 'amdguid-glow-bin' 'amdguid-wayland-bin' 'amdvold-bin')

build() {
    cd $srcdir/
    tar -xvf $srcdir/amdfand-1.0.11.tar.gz
}

package() {
    cd $srcdir/
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/lib/systemd/system/
    install -m 0755 $srcdir/amdfand $pkgdir/usr/bin
    install -m 0755 $srcdir/amdfand.service "$pkgdir/usr/lib/systemd/system/amdfand.service"
}

#vim: syntax=sh
