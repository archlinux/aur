# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgname=magic-wormhole
pkgver=0.10.4
pkgrel=1
pkgdesc="Securely transfer data between computers"
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}/${pkgver}"
license=('MIT')
depends=('python' 'python-click' 'python-cffi' 'python-autobahn' 'python-tqdm' 'python-hkdf' 'python-pynacl' 'python-spake2' 'python-humanize' 'python-idna' 'python-service-identity' 'python-ipaddress' 'python-txtorcon')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
conflicts=("wormhole" "wormhole-server")
provides=("wormhole" "wormhole-server")
md5sums=('b979db8c6ed1895c11280ec24c9d9d55')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
