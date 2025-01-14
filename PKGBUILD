# Maintainer: muio <muio at airmail dot cc>

pkgname=cmake-init
_name=${pkgname#python-}
pkgver=0.41.0
pkgrel=1
pkgdesc="The missing CMake project initializer"
arch=('any')
url="https://github.com/friendlyanon/cmake-init"
license=('GPL3')
depends=('python3')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/friendlyanon/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('141e5bb2a70a3f66c45929940e963a31fe42888a6c173014c691555bb0a1ae0f')

build() {
  cd "$pkgname-$pkgver/package"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver/package"
  python setup.py install --root="$pkgdir" --optimize=1
}
