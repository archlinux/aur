# Maintainer: Matthias Mailänder <matthias@mailaender.name>
pkgname=python-plotdigitizer
pkgver=0.3.1
pkgrel=1
pkgdesc=" A Python utility to digitize plots."
arch=('any')
url="https://github.com/dilawar/PlotDigitizer"
license=('GPL-3.0')
depends=('python-cycler' 'python-contourpy' 'python-fonttools' 'python-kiwisolver' 'python-numpy' 'python-packaging' 'python-pillow' 'python-pyparsing' 'python-dateutil')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel' 'python-typer' 'python-loguru')
source=("plotdigitizer-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b2a6039e2f09251683a2ba82f271014f3359e65736341bc65d884e9c9a67be75')

build() {
  cd "PlotDigitizer-$pkgver"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

package() {
  cd "PlotDigitizer-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
