# Maintainer: muio <muio at airmail dot cc>

pkgname=cmake-init
_name=${pkgname#python-}
pkgver=0.40.9
pkgrel=1
pkgdesc="The missing CMake project initializer"
arch=('any')
url="https://github.com/friendlyanon/cmake-init"
license=('GPL3')
depends=('python3')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/friendlyanon/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5949808ebbeb9ef58ebcd5f35d595e8e7f04c67413e387e200004ca1fc6f27dc')

build() {
  cd "$pkgname-$pkgver/package"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver/package"
  python setup.py install --root="$pkgdir" --optimize=1
}
