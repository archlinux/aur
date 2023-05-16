# Maintainer:  Razer <razer@neuf.fr>

pkgname=python-pyserial-asyncio
_pypi_pkgname=pyserial-asyncio
pkgver=0.6
pkgrel=3
pkgdesc="Asyncio extension package for pyserial"
arch=(any)
url="https://github.com/pyserial/pyserial-asyncio"
license=('BSD')
depends=('python-pyserial')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('b6032923e05e9d75ec17a5af9a98429c46d2839adfaf80604d52e0faacd7a32f')

build() {
  cd "$srcdir/pyserial-asyncio-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/pyserial-asyncio-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

