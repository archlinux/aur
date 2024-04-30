# Maintainer: Sean Snell <ssnell@lakecs.net>

pkgname=python-prusalinkpy
gitname=prusalinkpy
pkgver=2.1.1
pkgrel=1
pkgdesc="PrusaLinkPy is a library to use the Prusa Link API."
arch=('x86_64')
url="https://github.com/guillaume-rico/PrusaLinkPy"
license=('MIT')
# depends=('python-rpyc' 'python-loguru')
provides=('python-prusalinkpy')
# source=("${gitname}-${pkgver}.tar.gz::https://github.com/guillaume-rico/PrusaLinkPy/archive/refs/tags/${pkgver}.tar.gz")
source=('python-prusalinkpy::git+https://github.com/guillaume-rico/PrusaLinkPy.git#commit=4f97578')

# Upstream tar.gz

# sha512sums=('19a90d813f7ec3286e3b08b4141c2ad6776d1e949e370018edd4273ded2db3f22271353c38ad1efe90e9de1e39d4f62dfa1271e81cceb8b11772da264f2090d0')
sha512sums=('SKIP')

build() {
  cd "${srcdir}"/"${pkgname}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  python -m installer --destdir="${pkgdir}" "${srcdir}"/"${pkgname}"/dist/*.whl
}


