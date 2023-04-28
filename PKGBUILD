# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-podman
pkgver=4.5.0
pkgrel=1
pkgdesc="Python bindings for Podman's RESTful API"
arch=('any')
url="https://github.com/containers/podman-py"
license=('Apache')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5cf5f5c4cb3f7616a38ff92a534f4221517c6d0b9d6a5f2fda6608f5e00fb906')
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
