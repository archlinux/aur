# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=econnman
pkgver=1
pkgrel=1
pkgdesc="Enlightenment ConnMan user interface"
arch=('any')
url="http://www.enlightenment.org"
license=('LGPL3')
depends=('python2-elementary' 'python2-e_dbus' 'python2-edje' 'python2-ecore' 'connman')
conflicts=('econnman-svn')
source=("http://packages.profusion.mobi/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('cec2bd0aaf9d8975dd69ac6b5a4e638e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's:/usr/bin/python:/usr/bin/python2:g' econnman-bin.in

  PYTHON=/usr/bin/python2 \
  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
