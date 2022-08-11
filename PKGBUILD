# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-podman
pkgver=4.2.0
pkgrel=1
pkgdesc="Python bindings for Podman's RESTful API"
arch=('any')
url="https://github.com/containers/podman-py"
license=('Apache')
source=("$url/releases/download/v$pkgver/podman-$pkgver.tar.gz")
sha256sums=('7a5cdc5ba01ddfde2bc546af0437e59ee887ec6df7dea2aad379651e216c70a4')
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
