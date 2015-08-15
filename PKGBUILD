# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-pyramid
pkgver=1.6a2
pkgrel=1
pkgdesc='Pyramid is a very general open source Python web framework.'
arch=('any')
url='http://www.pylonsproject.org/'
license=('custom:BSD')
makedepends=('python')
optdepends=(
         'python-pyramid-debugtoolbar: development mode'
         'python3-paste-deploy: pserve/pcreate'
         'python3-chameleon: pserve/pcreate'
         'python-waitress: pserve/pcreate'
	)
source=(https://pypi.python.org/packages/source/p/pyramid/pyramid-${pkgver}.tar.gz)
sha256sums=('205e8bbffe27c3f1e74e3c9414b20e65b805cbeddc783cd957126b84469cc949')

build() {
  cd $srcdir
  cp -r pyramid-$pkgver
}

check() {
  cd $srcdir/pyramid-$pkgver 
  python3 setup.py check
}

package_python-pyramid() {
  depends=('python' 'python-mako' 'python-webob' 'python-repoze.lru' \
    'python-zope-deprecation' 'python-zope-interface' 'python-venusian' \
    'python-translationstring' 'python-setuptools')
  cd "$srcdir/pyramid-$pkgver"
  python3 setup.py install --root "${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
