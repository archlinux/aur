# Maintainer: Sean Snell <ssnell@lakecs.net>

pkgname=python-prusalinkpy
gitname=PrusaLinkPy-version_2.2.1
pkgver=2.2.1
pkgrel=1
pkgdesc="PrusaLinkPy is a library to use the Prusa Link API."
arch=('x86_64')
url="https://github.com/guillaume-rico/PrusaLinkPy"
license=('MIT')
provides=('python-prusalinkpy')
source=("${gitname}-${pkgver}.tar.gz::https://github.com/guillaume-rico/PrusaLinkPy/archive/refs/tags/version_${pkgver}.tar.gz")

# Upstream tar.gz
sha512sums=('c2ebf392d7dd09afbc8b663a928ead3261714a445634aa90a66bbab762210a99a26d4b556073c04d54d764ba56d3c4b3064d3ab0ff767ae85c1aa3c93b1ba4a3')

build() {
  cd "${srcdir}"/"${gitname}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  python -m installer --destdir="${pkgdir}" "${srcdir}"/"${gitname}"/dist/*.whl
}


