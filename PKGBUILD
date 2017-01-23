# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgname=magic-wormhole
pkgver=0.9.2
pkgrel=3
pkgdesc="Securely transfer data between computers"
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}/${pkgver}"
license=('MIT')
depends=('python' 'python-click' 'python-cffi' 'python-autobahn' 'python-tqdm' 'python-hkdf' 'python-pynacl' 'python-spake2' 'python-humanize' 'python-idna' 'python-service-identity') 
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/72/74/8e92a486f9ec785056c6fd98140a1ff4098609f981a8a65d391dc6e0d444/magic-wormhole-0.9.2.tar.gz")
md5sums=('7bd0322c49507185e0ef3d32a059ee29')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
