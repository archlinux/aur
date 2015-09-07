# Contributor: Dariusz 'quasi' Panchyrz <quasi@aur.archlinux.org>

pkgname=modglue
pkgver=1.19
pkgrel=1
pkgdesc="Modglue library for Cadabra computer algebra system (CAS)"
arch=('i686' 'x86_64')
url="http://cadabra.phi-sci.com/"
license=('GPL')
depends=('libsigc++')
install=$pkgname.install
source=(http://cadabra.phi-sci.com/$pkgname-$pkgver.tar.gz)
md5sums=('0d3d764c93f8c1464852f78d8493476b')


build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
