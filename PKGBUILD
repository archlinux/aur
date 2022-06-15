# Maintainer Adrian Woźniak <adrian.wozniak@ita-prog.pl>

pkgbase=amdguid-wayland-bin
pkgname=amdguid-wayland-bin
pkgver=1.0.11
pkgrel=1
pkgdesc="AMDGPU temperature and fan speed monitoring tool"
url="https://github.com/Eraden/amdgpud"
license=('MIT' 'Apache-2.0')
source=( "https://github.com/Eraden/amdgpud/releases/download/v${pkgver}/amdguid-wayland.tar.gz")
arch=('x86_64')
md5sums=( '2edda576321f62d3bd04b75a5478f8dc')
keywords=( 'amdgpu' 'controller' 'fan', 'overclocking', 'voltage')
depends=('amdfand-bin')
optdepends=('amdmond-bin' 'amdvold-bin')

build() {
    cd $srcdir/
    tar -xvf $srcdir/amdguid-wayland.tar.gz
}

package() {
    cd $srcdir/
    mkdir -p $pkgdir/usr/bin/
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    install -m 0755 $srcdir/amdguid $pkgdir/usr/bin
    install -m 0755 $srcdir/amdgui-helper $pkgdir/usr/bin
    install -m 0755 $srcdir/amdgui-helper.service "$pkgdir/usr/lib/systemd/system/amdgui-helper.service"
}

#vim: syntax=sh