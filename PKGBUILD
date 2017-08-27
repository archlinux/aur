# Maintainer: Kevin Rauwolf <sweetpea-aur AT tentacle DOT net>

pkgbase=u2fval
pkgname=(python-${pkgbase} python2-${pkgbase})
pkgver=2.0.0
pkgrel=1
pkgdesc="Python based U2F Validation Server"
arch=('any')
url="https://github.com/Yubico/u2fval"
license=('BSD')
source=("https://files.pythonhosted.org/packages/source/${pkgbase::1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
md5sums=('007eb888b7e0576c82fd221f5af60b17')
makedepends=('python2-flask' 'python2-flask-sqlalchemy' 'python2-u2flib-server')

prepare() {
  cp -a "$srcdir/$pkgbase-$pkgver"{,-py2}
}

package_python-u2fval() {
  depends=('python-u2flib-server' 'python-flask' 'python-flask-sqlalchemy')
  optdepends=('python-memcached')
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-u2fval() {
  depends=('python2-u2flib-server' 'python2-flask' 'python2-flask-sqlalchemy')
  optdepends=('python2-memcached')
  cd "$srcdir/$pkgbase-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
