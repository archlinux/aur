# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgbase=magic-wormhole
_pkgname='magic-wormhole'
pkgname=('python2-magic-wormhole' 'python-magic-wormhole')
pkgver=0.11.2
pkgrel=1
pkgdesc="Securely transfer data between computers"
arch=('any')
url="https://pypi.python.org/pypi/${_pkgname}/${pkgver}"
license=('MIT')
depends=('python-click' 'python2-click' 'python-cffi' 'python2-cffi' 'python-autobahn' 'python2-autobahn' 'python-tqdm' 'python2-tqdm' 'python-hkdf' 'python2-hkdf' 'python-pynacl' 'python2-pynacl' 'python-spake2' 'python2-spake2' 'python-humanize' 'python-idna' 'python2-idna' 'python-service-identity' 'python2-service-identity' 'python-ipaddress' 'python2-ipaddress' 'python-txtorcon' 'python2-txtorcon')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
conflicts=("wormhole" "wormhole-server")
provides=("wormhole" "wormhole-server")
replaces=("wormhole" "wormhole-server")
sha512sums=('890c0f1f946dfd9a9bde2ec0079c55dc23b328e04780e6baf8c580dfd068bf37a5b2e00e12119be6529a6e0893d4f711145e04c349ccfdf7ef91e87cef785d36')

prepare() {
  cp -a ${_pkgname}-${pkgver}{,-py2}
} 

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
  python2 setup.py build
}

package_python2-magic-wormhole() {
  pkgdesc="Securely transfer data between computers"
  depends=('python2-click' 'python2-cffi' 'python2-autobahn' 'python2-tqdm' 'python2-hkdf' 'python2-pynacl' 'python2-spake2' 'python2-idna' 'python2-service-identity' 'python2-ipaddress' 'python2-txtorcon')
  cd "${srcdir}/${_pkgname}-${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

package_python-magic-wormhole() {
  pkgdesc="Securely transfer data between computers"
  depends=('python-click' 'python-cffi' 'python-autobahn' 'python-tqdm' 'python-hkdf' 'python-pynacl' 'python-spake2' 'python-humanize' 'python-idna' 'python-service-identity' 'python-ipaddress' 'python-txtorcon')
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
