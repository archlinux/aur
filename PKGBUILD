# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=imediff
pkgver=2.6
pkgrel=1
pkgdesc="ncurses-based 2/3 file merge tool"
arch=('any')
url="https://github.com/osamuaoki/imediff"
license=('GPL2')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('453b81425e6c08b7500b3ca9c0bdf32716d3ae15d3bbdda0c258acd750dda819')

build() {
  cd "${pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
