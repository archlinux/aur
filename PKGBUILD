# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-pycobertura
pkgver=2.0.0
pkgrel=1
pkgdesc="Code coverage diff tool for Cobertura reports"
arch=(x86_64)
url="https://github.com/aconrad/pycobertura"
license=(MIT)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('5eaa1ebcf9ca4b3c6679b74ac850da406c9b5cdec11d8e71fed59f70819d5d14')
depends=(python python-{click,colorama,jinja,lxml,tabulate})
makedepends=(python-setuptools)

build() {
  cd "pycobertura-${pkgver}"
  python setup.py build
}

package() {
  cd "pycobertura-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
