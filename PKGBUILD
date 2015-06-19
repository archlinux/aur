# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-translationstring
_pkgname=translationstring
pkgver=1.3
pkgrel=1
pkgdesc="Utility library for i18n relied on by various Repoze and Pyramid packages"
arch=('any')
license=('custom:BSD')
url="https://github.com/Pylons/translationstring"
depends=('python')
makedepends=('python-distribute')
source=(https://pypi.python.org/packages/source/t/translationstring/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('4ee44cfa58c52ade8910ea0ebc3d2d84bdcad9fa0422405b1801ec9b9a65b72d')

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

