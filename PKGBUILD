# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-podman
pkgver=3.2.1
pkgrel=2
pkgdesc="Python bindings for Podman's RESTful API"
arch=('any')
url="https://github.com/containers/podman-py"
license=('Apache')
source=("$url/releases/download/v$pkgver/podman-$pkgver.tar.gz")
sha256sums=('12a2f5acf449f203739a736021b3df36b31d4c25ec13849d17fec6657ba07b56')
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
