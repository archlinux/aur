# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-pycobertura
pkgver=0.10.5
pkgrel=1
pkgdesc="Code coverage diff tool for Cobertura reports"
arch=('x86_64')
url="https://github.com/aconrad/pycobertura"
license=('MIT')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('909f99348e20b1bc69d68ea39c874e93ae586995fcfff4aef4a8dff07fa7f56f')
depends=('python')
makedepends=('python-setuptools')

build() {
  cd "pycobertura-${pkgver}"
  python setup.py build
}

package() {
  cd "pycobertura-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
