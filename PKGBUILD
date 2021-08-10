# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=plex-remote
pkgver=1.0.2
pkgrel=2
pkgdesc="A library for easy implementing a remote plex client"
arch=('any')
url="https://github.com/tijder/plex-remote"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('679bd00a06a19dddecbf8d3c3cce9496de69d7e9d5592f9c818cc469ca80d786')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}