# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-pyramid
pkgver=1.9.1
pkgrel=1
pkgdesc='Pyramid is a very general open source Python web framework.'
arch=('any')
url='http://www.pylonsproject.org/'
license=('custom:BSD')
makedepends=('python')
optdepends=(
         'python-pyramid-debugtoolbar: development mode'
         'python-pastedeploy: pserve/pcreate'
         'python-chameleon: pserve/pcreate'
         'python-waitress: pserve/pcreate'
	)

source=(https://pypi.python.org/packages/9a/57/73447be9e7d0512d601e3f0a1fb9d7d1efb941911f49efdfe036d2826507/pyramid-${pkgver}.tar.gz)
sha256sums=('840f4bbd5994609340de35079da0d1dd94f79942e27818d5d8566f8009fb0b36')

build() {
  msg "Building Pyramid for Python3"
  cd "$srcdir"/pyramid-$pkgver
  python setup.py build
}

check() {
  cd $srcdir/pyramid-$pkgver
  python setup.py check
}

package_python-pyramid() {
  depends=('python' 'python-mako' 'python-webob' 'python-repoze.lru' \
    'python-zope-deprecation' 'python-zope-interface' 'python-venusian' \
    'python-translationstring' 'python-setuptools' 'python-hupper')
  cd "$srcdir/pyramid-$pkgver"
  python setup.py install --root "${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
