# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-podman
pkgver=4.3.0
pkgrel=1
pkgdesc="Python bindings for Podman's RESTful API"
arch=('any')
url="https://github.com/containers/podman-py"
license=('Apache')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e49217217479422d6518a56e7460ef76fa0ebfbbe0e5a501372e429a475c1e4e')
depends=('python')
makedepends=('python-setuptools')
provides=('python-podman-py')

build() {
  cd "podman-py-${pkgver}"
  python setup.py build
}

package() {
  cd "podman-py-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
