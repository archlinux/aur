# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-aiopath
_name=${pkgname#python-}
pkgver=0.7.7
pkgrel=1
epoch=1
pkgdesc="Asynchronous pathlib for Python"
arch=('any')
url="https://github.com/alexdelorenzo/aiopath"
license=('LGPL-3.0-or-later')
depends=(
  'python-aiofile'
  'python-anyio'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ad4b9d09ae08ddf6d39dd06e7b0a353939e89528da571c0cd4f3fe071aefad4f')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
