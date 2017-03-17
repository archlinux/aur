# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-pyramid-debugtoolbar
_pkgname=pyramid_debugtoolbar
pkgver=3.0.5
pkgrel=1
pkgdesc='A package which provides an interactive HTML debugger for Pyramid application development'
arch=('any')
license=('custom:BSD')
url='https://github.com/Pylons/pyramid_debugtoolbar'
depends=('python'
         'python-pyramid'
	 'python-pygments')
makedepends=('python-distribute')
source=(https://pypi.python.org/packages/64/0e/df00bfb55605900e7a2f7e4a18dd83575a6651688e297d5a0aa4c208fd7d/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('6bf9dd67e75ef89c91a70d479a84912a86f4cc81183cfd44e5f0b7704fcd4ffc')

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}


# vim:set ts=2 sw=2 et:
