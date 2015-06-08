# Contributor: Sean Bartell <archlinux@yotann.org>
pkgname=seq24-bzr
pkgver=136
pkgrel=1
pkgdesc="A pattern-based midi sequencer with strong live performance functions"
arch=('i686' 'x86_64')
url="http://launchpad.net/seq24"
license=('GPL')
depends=('gtkmm>=2.4.0')
makedepends=('bzr')
provides=('seq24')
conflicts=('seq24')
source="bzr+http://bazaar.launchpad.net/%7Eseq24team/seq24/trunk"
md5sums=("SKIP")

build() {
    cd trunk
    autoreconf -i
    ./configure --prefix=/usr --disable-lash
    make
}

package() {
    cd trunk
    make DESTDIR="$pkgdir/" install
}
