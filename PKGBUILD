# Maintainer: D3vil0p3r <vozaanthony [at] gmail [dot] com>

pkgname=python-podman
pkgver=5.2.0
pkgrel=1
pkgdesc="Python bindings for Podman's RESTful API"
arch=('any')
url="https://github.com/containers/podman-py"
license=('Apache')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4e4a66a451073348fe6f1ef97a3237242ce868dbcb1d8ac4643773cbb210a294')
depends=('python' 'python-requests')
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
