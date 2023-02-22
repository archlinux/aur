# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-podman
pkgver=4.4.1
pkgrel=1
pkgdesc="Python bindings for Podman's RESTful API"
arch=('any')
url="https://github.com/containers/podman-py"
license=('Apache')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('73250324afafc5573c67d31b1637d7f61703088d71b87278273b3ac66e11d5a3')
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
