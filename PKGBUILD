# Maintainer: Marcus Johansson <polarn@gmail.com>

pkgname=python-validio-cli
_name=validio_cli
pkgver=0.9.0
pkgrel=2
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
sha256sums=('74e49aa68c68b4602ff5d0b1b943ae8a8f82358d0cef13b93b7fde3b0866b7c6')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
