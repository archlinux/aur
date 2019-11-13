# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-hupper
_pkgname=hupper
pkgver=1.9.1
pkgrel=1
pkgdesc="Integrated process monitor for developing servers."
arch=('any')
url="https://github.com/Pylons/hupper/"
license=('MTI')
depends=('python2')
makedepends=('python2-distribute')
source=(https://files.pythonhosted.org/packages/09/3a/4f215659f31eeffe364a984dba486bfa3907bfcc54b7013bdfe825cebb5f/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('3b1c2222ec7b8159e7ad059e4493c6cc634c86184af0bf2ce5aba6edd241cf5f')

build(){
cd ${srcdir}/${_pkgname}-${pkgver}
python2 setup.py build
}

package() {
cd ${srcdir}/${_pkgname}-${pkgver}
python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

