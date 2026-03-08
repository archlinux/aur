# Maintainer: Murtaza Patel <murtazapatel89100@gmail.com>
pkgname=filecraft-cli
pkgver=1.1.0
pkgrel=1
pkgdesc="A CLI organizer you didn’t know you needed — yet."
arch=('any')
url="https://github.com/murtazapatel89100/Filecraft"
license=('MIT')

depends=('python' 'python-typer')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')

source=("https://pypi.io/packages/source/f/filecraft-cli/filecraft_cli-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/filecraft_cli-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/filecraft_cli-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
