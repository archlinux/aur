# Maintainer: Adán Sánchez de Pedro <adan at stampery dot com>
pkgbase=('mongoaudit')
pkgname=('mongoaudit')
_module='mongoaudit'
pkgver='0.1.0'
pkgrel=1
pkgdesc="An automated pentesting tool that lets you know if your MongoDB instances are properly secured"
url="https://github.com/stampery/mongoaudit"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/m/mongoaudit/mongoaudit-${pkgver}.tar.gz")
md5sums=('f2bfbfeeb2cecbeb42570dac5912a697')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
