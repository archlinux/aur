# Maintainer: David Adler <d.adler@posteo.de>
# Contributor: Sean Bolton <smbolton at jps dot net>
# Contributor: Felix Salfelder <felix@salfelder.org>

pkgname=ghostess
pkgver=20210101
pkgrel=1
pkgdesc="a simple GTK host for DSSI plugins"
arch=('x86_64')
url="http://www.smbolton.com/linux.html"
license=('GPL')
depends=('gtk2' 'liblo' 'jack' 'alsa-lib')
makedepends=('dssi' 'ladspa')
source=(http://www.smbolton.com/linux/$pkgname-$pkgver.tar.bz2)
md5sums=('c084d46422a56f128b572523c89caf7d')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr --with-jackmidi
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir/" install
}

