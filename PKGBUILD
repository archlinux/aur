# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-pyramid-debugtoolbar
_pkgname=pyramid_debugtoolbar
pkgver=2.3
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
sha256sums=('38c4ae0524b7e045f816c96697369849c0f8562e3f1ae0fbaf168b53b2105ea3')

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}


# vim:set ts=2 sw=2 et:
