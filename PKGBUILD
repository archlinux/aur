# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildstream-plugins
pkgver=2.1.0
pkgrel=1
pkgdesc="A collection of plugins for the BuildStream project."
arch=(any)
url="https://buildstream.build"
license=('Apache')
depends=(
    buildstream
    # Programmes that are requered for the source plugins
    bzr
    git
    patch
    python-pip
    python-requests
    python-tomli # Replacement for “tomllib”
    # Sources “cargo” and “docker” seam to not nead any programmes
)
makedepends=(cython python-packaging python-setuptools)
source=("git+https://github.com/apache/buildstream-plugins.git#tag=2.1.0&commit=940406754d8e14e1868c2950914260aaf0678838")
sha256sums=('SKIP')

build() {
  cd buildstream-plugins
  python setup.py build
}

package() {
  cd buildstream-plugins
  python setup.py install --root="$pkgdir/" --skip-build
}
