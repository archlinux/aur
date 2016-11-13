# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgname=python-spake2
pkgver=0.7
pkgrel=1
pkgdesc="This library implements the SPAKE2 password-authenticated key exchange"
arch=('any')
url="https://pypi.python.org/packages/10/7d/${pkgname#python-}-${pkgver}"
license=('MIT')
depends=('python' 'python-hkdf')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/10/7d/7e815d8e25ddd08edd46dc5202e3b30c61d15a68c0166e03a4dd37a18466/spake2-0.7.tar.gz#md5=53bb859d1dff2830b26b6d5852801c5a/${pkgname#python-}-${pkgver}.tar.gz")
md5sums=('53bb859d1dff2830b26b6d5852801c5a')

build() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
