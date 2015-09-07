# Contributor: Dariusz 'quasi' Panchyrz <quasi@aur.archlinux.org>

pkgname=cadabra
pkgver=1.33
pkgrel=3
pkgdesc="Cadabra is a computer algebra system (CAS)"
arch=('i686' 'x86_64')
url="http://cadabra.phi-sci.com/"
license=('GPL')
depends=('conlie' 'modglue' 'gmp' 'pcre') # for gui: 'gtkmm' 'dvipng' 'texlive' 'breqn' http://www.ctan.org/pkg/breqn
install=$pkgname.install
source=(http://cadabra.phi-sci.com/$pkgname-$pkgver.tar.gz)
md5sums=('cee8ae23c169958aba09b64e4ea479ce')


build() {
  cd $srcdir/$pkgname-$pkgver/
  ./configure --prefix=/usr #--enable-gui
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make DESTDIR="${pkgdir}" install
}
