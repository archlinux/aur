# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildstream-plugins-experimental
pkgver=1.95.4
pkgrel=1
pkgdesc="A collection of experimental BuildStream plugins."
arch=(any)
url="https://buildstream.build"
license=('LGPL')
depends=(
    buildstream
    # Programmes that are requered for the source plugins
    bazel
    git
    ostree
    python-arpy
    python-requests
    quilt
    # Sources “cargo” and “docker” seam to not nead any programmes
)
makedepends=(cython git python-packaging python-setuptools)
source=("git+https://gitlab.com/BuildStream/bst-plugins-experimental.git#tag=1.95.4&commit=9454f78cb612094f98f7765e8a8ef3d139d6b1bd")
sha256sums=('SKIP')

build() {
  cd bst-plugins-experimental
  python setup.py build
}

package() {
  cd bst-plugins-experimental
  python setup.py install --root="$pkgdir/" --skip-build
}
