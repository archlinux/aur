# Maintainer: Firegore <admin@firegore.com>
pkgname=bloonix-plugins-nginx
#_pkgname=
provides=('bloonix-plugins-nginx')
pkgver=0.9
pkgrel=1
pkgdesc='Bloonix Monitoring NginX Plugin'
arch=('i686' 'x86_64')
url='https://bloonix.org'
license=('GPLv3')
options=('!emptydirs')

depends=('bloonix-core')
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
md5sums=('b3dc4faf6cc9ac7cf3bd2036e9913606')
sha1sums=('9eccb19b720d9060636acc663a35c252154e76f3')
