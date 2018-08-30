# Maintainer: Niklas <dev@n1klas.net>

pkgname=python2-otr
_name=python-otr
pkgver=1.2.0
pkgrel=1
pkgdesc="Off-The-Record Messaging (OTR) protocol implementation for python"
arch=('any')
url="https://github.com/AGProjects/python-otr"
license=('LGPL2.1')
depends=('python2')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('4230fdc4246b366c49a9593280775e65b38be9083e72e0f93b974fdf3b2fb374b87925b7b0f842c2e62f12a7b5df7f3a7bc8e1dd11406187f6bf7e73b1481010')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --skip-build --optimize=1
}
