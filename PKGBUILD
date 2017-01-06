# Maintainer: Firegore <admin@firegore.com>
pkgname=bloonix-plugins-apache
#_pkgname=
provides=('bloonix-plugins-apache')
pkgver=0.12
pkgrel=1
pkgdesc='Bloonix Monitoring Plugin - Apache'
arch=('i686' 'x86_64')
url='https://bloonix.org'
license=('GPLv3')
options=('!emptydirs')

depends=('bloonix-core' 'curl')
source=(https://download.bloonix.de/sources/$pkgname-$pkgver.tar.gz)

build() {
    cd "$srcdir"/$pkgname-$pkgver
    #perl Configure.PL
    perl Configure.PL --prefix /usr 
    make
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install

    mkdir $pkgdir/etc

}

# vim:set ts=2 sw=2 et:
md5sums=('9ec425b6f6c06c5510cc427336efc48f')
sha1sums=('b6358a82978b4fb31e28f8105b11896ff9d841e3')
