# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildstream-plugins
pkgver=2.0.1
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
source=("git+https://github.com/apache/buildstream-plugins.git#tag=2.0.1&commit=144152fbce16cfcf58653585cec276bd2086c373")
sha256sums=('SKIP')

build() {
  cd buildstream-plugins
  python setup.py build
}

package() {
  cd buildstream-plugins
  python setup.py install --root="$pkgdir/" --skip-build
}
