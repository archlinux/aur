# Maintainer: Adán Sánchez de Pedro <adan at stampery dot com>
pkgbase=('mongoaudit')
pkgname=('mongoaudit')
_module='mongoaudit'
pkgver='0.0.3'
pkgrel=2
pkgdesc="An automated pentesting tool that lets you know if your MongoDB instances are properly secured"
url="https://github.com/stampery/mongoaudit"
depends=('python2')
makedepends=('python2-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/m/mongoaudit/mongoaudit-${pkgver}.tar.gz")
md5sums=('040f6080e15fe2dbeff574bb98e0da67')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
