# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-hupper
_pkgname=hupper
pkgver=1.9
pkgrel=1
pkgdesc="Integrated process monitor for developing servers."
arch=('any')
url="https://github.com/Pylons/hupper/"
license=('MTI')
depends=('python2')
makedepends=('python2-distribute')
source=(https://files.pythonhosted.org/packages/eb/62/a54a34fddfec90ce650430203ee168804b925dd97138a5732b7d70b08627/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('afd4e7beedc7417fed12cb2e15a21610c73cb08821c7f09aa926be24d4038dae')

build(){
cd ${srcdir}/${_pkgname}-${pkgver}
python2 setup.py build
}

package() {
cd ${srcdir}/${_pkgname}-${pkgver}
python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

