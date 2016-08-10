# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgname=magic-wormhole
pkgver=0.8.1
pkgrel=2
pkgdesc="Securely transfer data between computers"
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}/${pkgver}"
license=('MIT')
depends=('python' 'python-click' 'python-autobahn' 'python-tqdm' 'python-hkdf' 'python-pynacl' 'python-spake2')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/ce/4f/37954f8e8211a656008326fbe33769cb8ab2fd20c226c8586399df06fddb/${pkgname}-${pkgver}.tar.gz")
md5sums=('630279be81ff2ea34b934208ca79f5df')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
