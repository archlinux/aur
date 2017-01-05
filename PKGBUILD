# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgname=magic-wormhole
pkgver=0.9.1
pkgrel=3
pkgdesc="Securely transfer data between computers"
arch=('any')
url="https://pypi.python.org/pypi/${pkgname}/${pkgver}"
license=('MIT')
depends=('python' 'python-click' 'python-cffi' 'python-autobahn' 'python-tqdm' 'python-hkdf' 'python-pynacl' 'python-spake2' 'python-humanize' 'python-idna' 'python-service-identity') 
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/0a/41/08466969762959a934b35dd6ce09c7097854b3f13a7fbfb3d71829efd3bb/magic-wormhole-0.9.1.tar.gz")
md5sums=('386d0b3be9e0f0f0e81cce815682db94')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
