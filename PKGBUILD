# Maintainer: Matthias Mailänder <matthias@mailaender.name>
pkgname=python-plotdigitizer
pkgver=0.2.3
pkgrel=1
pkgdesc=" A Python utility to digitize plots."
arch=('any')
url="https://github.com/dilawar/PlotDigitizer"
license=('GPL-3.0')
depends=('python-cycler' 'python-contourpy' 'python-fonttools' 'python-kiwisolver' 'python-numpy' 'python-packaging' 'python-pillow' 'python-pyparsing' 'python-dateutil')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("plotdigitizer-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad8af36f452a9431311004a32535f80b1316670dbf13f9bd31fed7f63e152444')

build() {
  cd "PlotDigitizer-$pkgver"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

package() {
  cd "PlotDigitizer-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
