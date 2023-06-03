# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-pybase62
_pkgname=pybase62
pkgver=1.0.0
pkgrel=1
pkgdesc="Python module for base62 encoding"
arch=("any")
url="https://github.com/suminb/base62"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('bb2a61a893647b802b7a6006883e137dcd47a2e53e41e6433dfc469b28add94717ec9a274da06e865a34441ebf125a633793d902c11af14eed0ee3f66f3cf7db')

build() {
  cd base62-${pkgver}
  python setup.py build
}

package() {
  cd base62-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
