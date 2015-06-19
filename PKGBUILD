# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-pyramid-debugtoolbar
_pkgname=pyramid_debugtoolbar
pkgver=2.4
pkgrel=1
pkgdesc='Interactive HTML debugger for Pyramid application development'
arch=('any')
license=('custom:BSD')
url='https://github.com/Pylons/pyramid_debugtoolbar'
depends=('python'
         'python-pyramid'
	 'python-pygments')
makedepends=('python-distribute')
source=(https://pypi.python.org/packages/source/p/pyramid_debugtoolbar/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('6ea0ffd2736d9c5dc8da4cb289c9eec87cac090b91ed717dc0127e9850f3191f')

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}


# vim:set ts=2 sw=2 et:
