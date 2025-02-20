# Maintainer: muio <muio at airmail dot cc>

pkgname=cmake-init
_name=${pkgname#python-}
pkgver=0.41.1
pkgrel=1
pkgdesc="The missing CMake project initializer"
arch=('any')
url="https://github.com/friendlyanon/cmake-init"
license=('GPL3')
depends=('python3')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/friendlyanon/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fa6ab1e39c2f20ccd5dc5e254d66059b9123a92c5af984bebc9950cec6715fad')

build() {
  cd "$pkgname-$pkgver/package"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver/package"
  python setup.py install --root="$pkgdir" --optimize=1
}
