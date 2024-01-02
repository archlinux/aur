# Maintainer: Marcus Johansson <polarn@gmail.com>

pkgname=python-validio-cli
_name=validio_cli
pkgver=0.12.0
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
sha256sums=('fb845e40d8924fbf2c87aea0fe64422863cb1595c57498f473975720e8453bc5')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
