# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-pyramid
pkgver=1.5.7
pkgrel=1
pkgdesc='Pyramid is a very general open source Python web framework.'
arch=('any')
url='http://www.pylonsproject.org/'
license=('custom:BSD')
depends=('python'
	 'python-mako'
	 'python-webob'
	 'python-repoze.lru'
	 'python-zope-deprecation'
	 'python-zope-interface'
	 'python-venusian'
	 'python-translationstring'
	 'python-setuptools'
	)
optdepends=(
         'python-pyramid-debugtoolbar: development mode'
         'python3-paste-deploy: pserve/pcreate'
         'python3-chameleon: pserve/pcreate'
         'python-waitress: pserve/pcreate'
	)
source=(https://pypi.python.org/packages/source/p/pyramid/pyramid-${pkgver}.tar.gz)
sha256sums=('c1302d5ccb6833e8794ddb649aa9bb64d86c05adb127c93e329f8863907449b4')

build() {
  cd "$srcdir/pyramid-$pkgver"
  python setup.py build
}

package() {
  cd $srcdir/pyramid-${pkgver}
  python setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
