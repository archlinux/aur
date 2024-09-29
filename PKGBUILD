# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=python-jsons
pkgver=1.6.3
pkgrel=1
pkgdesc="A Python lib for (de)serializing Python objects to/from JSON"
arch=('any')
url='https://github.com/ramonhagenaars/jsons'
license=('MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python-typish)
provides=("python-jsons")
source=("jsons::git+https://github.com/ramonhagenaars/jsons#tag=v$pkgver")
sha256sums=('SKIP')

pkgver() {
  cd jsons
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd jsons
    python -m build --wheel --no-isolation
}

package() {
    cd jsons
    python -m installer --destdir="$pkgdir" dist/*.whl
}
