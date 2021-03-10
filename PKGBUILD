# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>
pkgname=python2-trollius
_realname=trollius
pkgver=2.1.post2
pkgrel=1
pkgdesc="Port of the Tulip project (asyncio module, PEP 3156) on Python 2.7"
arch=("any")
url="http://trollius.readthedocs.org/"
license=('APACHE')
depends=('python2' 'python2-futures' 'python2-six')
optdepends=('python2-unittest2: to pass trollius unit tests')
source=("https://pypi.python.org/packages/source/t/$_realname/$_realname-$pkgver.tar.gz")
sha512sums=('fb6d0a1fe73cb4a5ba79da6d27dd31d45a7002172d3ea46dfe56a748901fb218db56d464cbcf41c2fc35dd7ddbb2a2a451d515a9c0453a3f1b82497a2e9d8b6c')

build() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
