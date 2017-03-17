# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-hupper
_pkgname=hupper
pkgver=0.4.4
pkgrel=1
pkgdesc="Integrated process monitor for developing servers."
arch=('any')
url="https://github.com/Pylons/hupper/"
license=('MTI')
depends=('python')
makedepends=('python-distribute')
source=(https://pypi.python.org/packages/32/aa/847c6ede6da7b2d9438c4ae5c4ce7c47f7db73572f4ea2566ffd83c23dd6/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('a44971bd58e904864f31058b2e64b5716568d7db67f34d8f83b4d40f268adf7a')

build(){
cd ${srcdir}/${_pkgname}-${pkgver}
python setup.py build
}

package() {
cd ${srcdir}/${_pkgname}-${pkgver}
python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

