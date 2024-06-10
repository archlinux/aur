# Maintainer: muio <muio at airmail dot cc>

pkgname=cmake-init
_name=${pkgname#python-}
pkgver=0.40.7
pkgrel=1
pkgdesc="The missing CMake project initializer"
arch=('any')
url="https://github.com/friendlyanon/cmake-init"
license=('GPL3')
depends=('python3')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/friendlyanon/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d86366bd608c91493059a195a3e0683cdeb94247f678ebf4117a910f5535335a')

build() {
  cd "$pkgname-$pkgver/package"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver/package"
  python setup.py install --root="$pkgdir" --optimize=1
}
