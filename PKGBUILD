# Maintainer: David Adler <d.adler@posteo.de>
# Contributor: Sean Bolton <smbolton at jps dot net>

pkgname=ghostess
pkgver=20120105
pkgrel=3
pkgdesc="a simple GTK host for DSSI plugins"
arch=('x86_64')
url="http://www.smbolton.com/linux.html"
license=('GPL')
depends=('gtk2' 'liblo' 'jack' 'alsa-lib')
makedepends=('dssi' 'ladspa')
source=(http://www.smbolton.com/linux/$pkgname-$pkgver.tar.bz2)
md5sums=('15bdcb0d4d3c68507f67d83e4bd3fe6a')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr --with-jackmidi
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir/" install
}

