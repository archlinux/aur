# Maintainer: quomoow <quomoow@gmail.com>
# Contributor: Sean Bartell <archlinux@yotann.org>

pkgname=seq24-bzr
pkgver=0.9.3
pkgrel=1
pkgdesc="A pattern-based midi sequencer with strong live performance functions"
arch=('i686' 'x86_64')
url="http://launchpad.net/seq24"
license=('GPL')
depends=('gtkmm>=2.4.0')
makedepends=('bzr')
provides=('seq24')
conflicts=('seq24')
source=("bzr+http://bazaar.launchpad.net/~${pkgname}team/${pkgname}/trunk")
md5sums=('SKIP')

build() {
    cd trunk

    autoreconf -i
    CXXFLAGS="-O2 -std=c++11"
    ./configure --prefix=/usr --disable-lash
    make
}

package() {
    cd trunk

    make DESTDIR="$pkgdir/" install
}
