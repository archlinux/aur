# Maintainer: Carmelo12341 <carmelo12341 at disroot dot com>

pkgname=minergate
pkgver=8.1
pkgrel=1
pkgdesc='Cryptocurrency GUI miner and Mining Pool'
arch=('x86_64')
url='http://www.minergate.com/'
provides=('minergate')
license=('custom')
source=('minergate-8.1.deb::https://minergate.com/download/ubuntu')
sha256sums=('1dbbbb8e0735cde239fca9e82c096dcc882f6cecda20bba7c14720a614c16e13')
depends=('ocl-icd')
optdepends=('bfgminer'
            'cuda: if you have an nvidia GPU')
install=${pkgname}.install

package() {
    bsdtar xf data.tar.gz
    rm -r opt/minergate/lib/libOpenCL.so*
    chmod -R g-w usr opt
    mv usr opt "${pkgdir}"
}
