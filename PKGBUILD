# Maintainer: D3vil0p3r <vozaanthony [at] gmail [dot] com>

pkgname=python-podman
pkgver=5.3.0
pkgrel=1
pkgdesc="Python bindings for Podman's RESTful API."
arch=('any')
url='https://github.com/containers/podman-py'
license=('Apache-2.0')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
depends=('python' 'python-requests')
makedepends=('python-setuptools')
provides=('python-podman-py')
sha512sums=('c880f67fda1d69d376a608fe05a79ce7c6ebf3a58ffb1b8c179685d07ddecc535b373c91f128313d68027bb53cdc6b96042f7f25ef5a274afd6a1cbab4dcd4b7')

build() {
  cd "podman-py-$pkgver"

  python setup.py build
}

package() {
  cd "podman-py-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
