# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgname='magic-wormhole'
pkgver=0.11.2
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
sha512sums=('890c0f1f946dfd9a9bde2ec0079c55dc23b328e04780e6baf8c580dfd068bf37a5b2e00e12119be6529a6e0893d4f711145e04c349ccfdf7ef91e87cef785d36')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
