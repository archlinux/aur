# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=pyrseas
_pkgname=Pyrseas
pkgver=0.4.0
pkgrel=1
pkgdesc="Framework and utilities to upgrade and maintain a relational database"
arch=(any)
url="http://www.pyrseas.org/"
license=('BSD')
depends=('python2' 'python2-distribute' 'python2-psycopg2' 'python2-yaml')
conflicts=()
source=(http://pypi.python.org/packages/source/P/$_pkgname/$_pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$_pkgname-$pkgver/
  python2 setup.py install --root=$pkgdir

  # XXX why are Pyrseas-0.4.0-py2.7.egg-info/* files not world-readable?
  chmod a+r -R "$pkgdir/usr/lib"

  install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
md5sums=('2673f3561d71397c1c57a9beabb58c04')
