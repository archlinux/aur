# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=python-questionary
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc="Python library to build pretty command line user prompts"
license=("MIT")
url="https://pypi.python.org/pypi/$_name"
depends=('python-prompt_toolkit')
makedepends=(python-build python-installer python-wheel python-poetry-core)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8681b9d9ec751347ab11af2204d063b856d06845b07b442951e081780e8cb8a6')
arch=('any')


build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
