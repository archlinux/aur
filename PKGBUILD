# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=swig
pkgver=1.3.40
pkgrel=1
pkgdesc="A compiler that makes it easy to integrate C and C++ code with scripting languages"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.swig.org/"
depends=('gcc-libs' 'zlib')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('2df766c9e03e02811b1ab4bba1c7b9cc')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
