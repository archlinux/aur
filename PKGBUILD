# Maintainer: wangjiezhe <wangjiezhe AT yandex DOT com>

pkgbase=cheroot
pkgname=(python-${pkgbase} python2-${pkgbase})
pkgver=5.7.0
pkgrel=1
pkgdesc="Highly-optimized, pure-python HTTP server"
arch=('any')
url="https://github.com/cherrypy/cheroot"
license=('BSD')
source=("https://files.pythonhosted.org/packages/source/${pkgbase::1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
md5sums=('9d7fd13b673cde93c26a04b4aa5fa9a1')

prepare() {
  cp -a "$srcdir/$pkgbase-$pkgver"{,-py2}
}

package_python-cheroot() {
  depends=('python-six')
  makedepends=('python-setuptools-scm')
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-cheroot() {
  depends=('python2-six')
  makedepends=('python2-setuptools-scm')
  cd "$srcdir/$pkgbase-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
