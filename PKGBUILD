# Maintainer: Tyler Langlois <ty@tjll.net>
# Contributor: Guillermo Garcia |AhIoRoS| <ahioros@gmail.com>
# Contributor: Mora <mora@index.hu>

pkgname=pidgin-extprefs
pkgver=0.7
pkgrel=5
pkgdesc='Plugin adds additional preferences for pidgin.'
arch=('i686' 'x86_64')
url='http://gaim-extprefs.sourceforge.net/'
license=('GPL')
depends=('pidgin' 'glibc')
makedepends=('pkgconfig')
source=("http://downloads.sourceforge.net/sourceforge/gaim-extprefs/$pkgname-$pkgver.tar.gz")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

sha256sums=('5f23def3dfc00c3597694177fbc2d6afa02d216c8f0d05b37307d3df509282e2')
