pkgname=sorta
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI tool to automatically sort PDFs into folders using keyword routing"
arch=("any")
url="https://github.com/woterr/sorta"
license=("MIT")

depends=(
  "python"
  "python-typer"
  "python-rich"
  "python-watchdog"
  "python-pypdf"
)

makedepends=(
  "python-build"
  "python-installer"
  "python-wheel"
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("bb086e5d0f1f83c5a9c04a4cd382db13020000bb97f533844ec60c3c0d406684")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
