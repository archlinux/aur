# Maintainer: D3vil0p3r <vozaanthony [at] gmail [dot] com>

pkgname=python-podman
pkgver=5.8.0
pkgrel=1
pkgdesc="Python bindings for Podman's RESTful API."
arch=('any')
url='https://github.com/containers/podman-py'
license=('Apache-2.0')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
provides=('python-podman-py')
options=(!emptydirs)
sha512sums=('a0d9014ba8d44a91c9c1dbb7afccf9b3ad3badfb05e44f780069bf0117cad08d753ebe19b05c2395f7112a0b36bd100bd1dd96c7d9c5ba1181c6d5d3a2d73c79')

build() {
  cd "podman-py-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "podman-py-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

