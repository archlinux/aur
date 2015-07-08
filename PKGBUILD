# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Georges Dubus <georges.dubus@compiletoi.net>
pkgname=wikkid-bzr
pkgver=74
pkgrel=1
pkgdesc="A wiki that is backed by Bazaar that allows local branching of the wiki for later merging. Also doesn't have any page locks and uses Bazaar's three way merging."
arch=(any)
url="https://launchpad.net/wikkid"
license=(AGPL)
depends=(bzr python2-pygments python2-jinja python2-webob python2-zope-interface
  python2-docutils python2-lxml python2-markdown python2-beautifulsoup3)
makedepends=(python2-setuptools)
source=("bzr+http://bazaar.launchpad.net/~wikkid/wikkid/trunk/")
md5sums=('SKIP')
conflicts=('wikkid')

pkgver() {
  cd "$srcdir/trunk"
  bzr revno
}

build() {
  cd "$srcdir/trunk"
  python2 setup.py build
}

package() {
  cd "$srcdir/trunk"
  python2 setup.py install --root="$pkgdir"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
