# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-pyramid
pkgver=1.8.3
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
source=(https://pypi.python.org/packages/12/e5/8cffc593b70ee6392ea08e8562843166895b96cf33ace892229bcfca410e/pyramid-${pkgver}.tar.gz)
sha256sums=('1218140ea016dcb63b962d44e43c6d26e448e6c2a49133dc52d01f01fbb2d5c3')

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
