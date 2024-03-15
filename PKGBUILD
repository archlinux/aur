# Maintainer: Marcus Johansson <polarn@gmail.com>

pkgname=python-validio-cli
_name=validio_cli
pkgver=0.15.0
pkgrel=1
pkgdesc="CLI to interact with the Validio platform"
url="https://pypi.org/project/validio-cli/"
depends=(
  'python-camel-converter'
  'python-classdiff'
  'python-prompt_toolkit'
  'python-tabulate'
  'python-typer'
  'python-validio-sdk')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel')
license=('Apache-2.0')
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ed6d3434a20145d5e08dd096e96dc7f9a03c68cea35428950000f17b460b3fbd')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
