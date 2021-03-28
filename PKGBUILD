# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-thrift-sasl'
_pkgname=thrift_sasl
pkgver=0.4.2
pkgrel=1
pkgdesc='Thrift SASL python module'
arch=('any')
url='https://github.com/cloudera/thrift_sasl'
license=('Apache2')
makedepends=('python-setuptools')
depends=('thrift')
checkdepends=()
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('6a1c54731cb3ce61bdc041d9dc36e21f0f56db0163bb7b57be84de3fda70922f')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
