# Maintainer Adrian Woźniak <adrian.wozniak@ita-prog.pl>

pkgbase=amdfand-bin
pkgname=amdfand-bin
pkgver=1.0.11
pkgrel=1
pkgdesc="AMDGPU fan speed management tool"
url="https://github.com/Eraden/amdgpud"
license=('MIT' 'Apache-2.0')
source=( "https://github.com/Eraden/amdgpud/releases/download/v${pkgver}/amdfand.tar.gz")
arch=('x86_64')
md5sums=( '2b208be3c3aedf5c672c83e759668dec')
keywords=( 'amdgpu' 'controller' 'fan', 'overclocking', 'voltage')
optdepends=('amdmond-bin' 'amdguid-glow-bin' 'amdguid-wayland-bin' 'amdvold-bin')

build() {
    cd $srcdir/
    tar -xvf $srcdir/amdfand.tar.gz
}

package() {
    cd $srcdir/
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/lib/systemd/system/
    install -m 0755 $srcdir/amdfand $pkgdir/usr/bin
    install -m 0755 $srcdir/amdfand.service "$pkgdir/usr/lib/systemd/system/amdfand.service"
}

#vim: syntax=sh