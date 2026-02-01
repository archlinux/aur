pkgname=sorta
pkgver=1.0.2
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
sha256sums=("bd521ec1b7c30fbcaf40260714bf5fe1fb0365c9c7fc0bfeb9bb3bea8d01203c")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
