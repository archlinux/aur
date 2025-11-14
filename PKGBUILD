pkgname=python-tensap
pkgver=1.8
pkgrel=1
pkgdesc="A Python package for the approximation of functions and tensors"
url="https://github.com/anthony-nouy/tensap"
arch=(any)
license=('LGPL')
makedepends=('python-setuptools')
depends=('python-scipy')
source=("https://github.com/anthony-nouy/tensap/archive/v${pkgver}.tar.gz")
sha256sums=('96166ff194a739b066eb0c0dc6dd4c7d91ac4b09a0d7c98800ce26d56e6afaec')

prepare() {
  cd "${srcdir}"/tensap-$pkgver
}

build() {
  cd "${srcdir}"/tensap-$pkgver
  python setup.py build
}

package() {
  cd "${srcdir}/tensap-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}


