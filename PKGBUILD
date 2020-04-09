# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-pyramid
pkgver=1.10.5
pkgrel=2
pkgdesc='A small, fast, down-to-earth, open source Python web framework.'
arch=('any')
url='https://pypi.org/project/pyramid/'
license=('BSD-derived Repoze Public License')
makedepends=('python2')
optdepends=(
         'python-pyramid-debugtoolbar: development mode'
         'python-pastedeploy: pserve/pcreate'
         'python-chameleon: pserve/pcreate'
         'python-waitress: pserve/pcreate'
	)
depends=('python2' 'python2-mako' 'python2-webob' 'python2-repoze.lru' \
  'python-zope-deprecation' 'python2-zope-interface' 'python2-venusian' \
  'python2-translationstring' 'python2-setuptools' 'python2-hupper')


source=(https://files.pythonhosted.org/packages/c2/43/1ae701c9c6bb3a434358e678a5e72c96e8aa55cf4cb1d2fa2041b5dd38b7/pyramid-${pkgver}.tar.gz)
sha256sums=('d80ccb8cfa550139b50801591d4ca8a5575334adb493c402fce2312f55d07d66')

build() {
  msg "Building Pyramid for Python 2"
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
