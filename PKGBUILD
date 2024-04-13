# Maintainer: muio <muio at airmail dot cc>

pkgname=cmake-init
_name=${pkgname#python-}
pkgver=0.40.6
pkgrel=1
pkgdesc="The missing CMake project initializer"
arch=('any')
url="https://github.com/friendlyanon/cmake-init"
license=('GPL3')
depends=('python3')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/friendlyanon/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('538f41f21b72d5ca40f7496bb3fbe3c48368dbaf212fbb6c8e16e4271240f6b8')

build() {
  cd "$pkgname-$pkgver/package"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver/package"
  python setup.py install --root="$pkgdir" --optimize=1
}
