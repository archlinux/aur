# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-podman
pkgver=3.2.0
pkgrel=1
pkgdesc="Python bindings for Podman's RESTful API"
arch=('any')
url="https://github.com/containers/podman-py"
license=('Apache')
source=("$url/releases/download/v$pkgver/podman-$pkgver.tar.gz")
sha256sums=('c0e81a9477b854a3ceeea2b6f8b2afc6bbbb86c85cbdebe9a75ae1c28c18c0c9')
depends=('python')
makedepends=('python-setuptools')
provides=('python-podman-py')

build() {
  cd "podman-${pkgver}"
  python setup.py build
}

package() {
  cd "podman-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
