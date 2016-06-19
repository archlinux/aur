# Maintainer: laptander <dev-laptander a|t yandex d|o|t ru>
# Previously contributed by zekeer

pkgname=kdeneur
pkgver=0.19.0
pkgrel=1
pkgdesc="KDE frontend for X Neural Switcher (XNeur)"
arch=('i686' 'x86_64')
url="http://xneur.ru/"
license=('GPLv3')
depends=('qt4' 'kdelibs' 'kdelibs4support' "xneur>=${pkgver}")
makedepends=('gcc' 'make')
source=("https://raw.githubusercontent.com/AndrewCrewKuznetsov/xneur-devel/master/dists/$pkgver/kdeneur_$pkgver.orig.tar.gz")
md5sums=('a0a33464c581d4e976f71837de08c07b')
 
build() {
    cd ${srcdir}/${pkgname}-${pkgver}
 
    ./configure --prefix=/usr
    make
}
 
package() {
    cd $srcdir/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}

