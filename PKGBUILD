# Maintainer: Andrew Shark <ashark at linuxcomp ru>
# Previously contributed by zekeer

pkgname=kdeneur
pkgver=0.20.0
pkgrel=1
pkgdesc="KDE frontend for X Neural Switcher (XNeur)"
arch=('i686' 'x86_64')
url="http://xneur.ru/"
license=('GPLv3')
depends=('qt4' 'kdelibs' 'kdelibs4support' "xneur>=${pkgver}")
makedepends=('gcc' 'make')
source=("https://raw.githubusercontent.com/AndrewCrewKuznetsov/xneur-devel/master/dists/$pkgver/kdeneur_$pkgver.orig.tar.gz")
md5sums=('ad32965516923317b4151b106292385d')
 
build() {
    cd ${srcdir}/${pkgname}-${pkgver}
 
    ./configure --prefix=/usr
    make
}
 
package() {
    cd $srcdir/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}

