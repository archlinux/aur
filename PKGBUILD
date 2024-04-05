# Maintainer: Marcus Johansson <polarn@gmail.com>

pkgname=python-validio-cli
_name=validio_cli
pkgver=0.16.0
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
sha256sums=('18ad621c17892d38477cdf91edf05f7097172cba3b00bc8da8db169f8a7388d5')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
