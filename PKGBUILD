# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-pyramid
pkgver=1.9.1
pkgrel=1
pkgdesc='Pyramid is a very general open source Python web framework.'
arch=('any')
url='http://www.pylonsproject.org/'
license=('custom:BSD')
makedepends=('python2')
optdepends=(
         'python-pyramid-debugtoolbar: development mode'
         'python-pastedeploy: pserve/pcreate'
         'python-chameleon: pserve/pcreate'
         'python-waitress: pserve/pcreate'
	)
depends=('python2' 'python2-mako' 'python2-webob' 'python2-repoze.lru' \
  'python2-zope-deprecation' 'python2-zope-interface' 'python2-venusian' \
  'python2-translationstring' 'python2-setuptools' 'python2-hupper')


source=(https://pypi.python.org/packages/9a/57/73447be9e7d0512d601e3f0a1fb9d7d1efb941911f49efdfe036d2826507/pyramid-${pkgver}.tar.gz)
sha256sums=('840f4bbd5994609340de35079da0d1dd94f79942e27818d5d8566f8009fb0b36')

build() {
  msg "Building Pyramid for Python3"
  cd "$srcdir"/pyramid-$pkgver
  python2 setup.py build
}

check() {
  cd $srcdir/pyramid-$pkgver
  python2 setup.py check
}

package() {
  cd "$srcdir/pyramid-$pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
