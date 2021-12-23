# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=python-pycobertura
pkgver=2.1.0
pkgrel=1
pkgdesc="Code coverage diff tool for Cobertura reports"
arch=(x86_64)
url="https://github.com/aconrad/pycobertura"
license=(MIT)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('aef34514f89fa45f8e416a7695fcb6e802b9d10081c8532f40b4335830e0854b')
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
