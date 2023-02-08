# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-podman
pkgver=4.4.0
pkgrel=1
pkgdesc="Python bindings for Podman's RESTful API"
arch=('any')
url="https://github.com/containers/podman-py"
license=('Apache')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f0c73fe2462620428d4f851dc7d9c7899a617e0b0feae06e44b468a8933315c')
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
