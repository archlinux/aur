# Contributor: Andrew Conkling <andrewski@fr.st>, Lorenz Moesenlechner <moesenle@gmail.com>
pkgname=python2-empy
realname=empy
pkgver=3.3
pkgrel=2
pkgdesc="A powerful and robust templating system for Python."
arch=(i686 x86_64)
url="http://www.alcyone.com/software/empy"
depends=('python2>=1.5.2')
license=('LGPL')
source=("http://www.alcyone.com/software/empy/empy-$pkgver.tar.gz")
md5sums=('e7b518a6fc4fd28fef87726cdb003118')

build() {
  cd $startdir/src/empy-$pkgver
  sed -e '1s?^.*$?#!/usr/bin/python2?' em.py > empy
  chmod -x em.py
  sed -i -e '1d' em.py
  python2 setup.py install --prefix=$pkgdir/usr
  install -D empy $pkgdir/usr/bin/empy
}
