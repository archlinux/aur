# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
_name=pyhanko-certvalidator
pkgname='python-pyhanko-certvalidator'
pkgver=0.19.5
pkgrel=1
pkgdesc="Validates X.509 certificates and paths"
url="https://github.com/MatthiasValvekens/certvalidator"
license=('MIT')
arch=('any')
depends=('python-requests' 'python-asn1crypto' 'python-oscrypto' 'python-cryptography'
         'python-uritools')
makedepends=('python-setuptools')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=('770111bd9f1654e250b5f6c78d91346579c2ec1a1af4ba40a50467e6bc546840')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-${pkgver}/"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
