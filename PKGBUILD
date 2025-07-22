# Maintainer: gonsolo@gmail.com
pkgname=openlane2
pkgver=3.0.0.dev23
pkgrel=1
pkgdesc="OpenLane2 ASIC flow used by TinyTapeout (commit 5e5f5fb)"
arch=('any')
url="https://github.com/TinyTapeout/openlane2"
license=('Apache')
depends=('python')
makedepends=('git' 'python-build' 'python-installer')
source=("${pkgname}::git+${url}#commit=5e5f5fb")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

