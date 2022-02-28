# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-podman
pkgver=4.0.0
pkgrel=1
pkgdesc="Python bindings for Podman's RESTful API"
arch=('any')
url="https://github.com/containers/podman-py"
license=('Apache')
source=("$url/releases/download/v$pkgver/podman-$pkgver.tar.gz")
sha256sums=('009e6a8874fed6a7c0cc80373dd4e1d5706598b8041cf809ee4b3294ac29ec5c')
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
