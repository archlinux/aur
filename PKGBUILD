# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgname='magic-wormhole'
pkgver=0.12.0
pkgrel=2
pkgdesc="Securely transfer data between computers"
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}/${pkgver}"
license=('MIT')
depends=('python-click' 'python-cffi' 'python-autobahn' 'python-tqdm' 'python-hkdf' 'python-pynacl' 'python-spake2' 'python-humanize' 'python-idna' 'python-service-identity' 'python-txtorcon')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
conflicts=("wormhole" "wormhole-server" "python-wormhole")
provides=("wormhole" "wormhole-server" "python-wormhole")
replaces=("wormhole" "wormhole-server" "python-wormhole")
sha512sums=('0ef4241a5692227206c1a07a2aed8a2c1575281d52db8bcdb8ffd070c158b4969126486b5e68e899f2100d7daedbbe0b91a7d667915bd5b86be26d6553b34dd6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
