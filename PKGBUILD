# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-pyramid
pkgver=1.6
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
sha256sums=('c921291d504ea2815a309632d9fd4a3a5a24dd6b7b5f60ee39c426ab266562de')

build() {
  msg "Building Pyramid for Python3"
  cd "$srcdir"/pyramid-$pkgver
  python3 setup.py build
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
