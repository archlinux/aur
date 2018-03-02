# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgname=python-spake2
pkgver=0.8
pkgrel=2
pkgdesc="This library implements the SPAKE2 password-authenticated key exchange"
arch=('any')
url="https://pypi.python.org/packages/10/7d/${pkgname#python-}-${pkgver}"
license=('MIT')
depends=('python' 'python-hkdf')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/s/spake2/spake2-${pkgver}.tar.gz")
md5sums=('53bb859d1dff2830b26b6d5852801c5a')

build() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
