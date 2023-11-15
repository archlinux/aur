# Maintainer: gilbus <aur (AT) tinkershell dot eu>
pkgname=python-xdg-base-dirs
_name=xdg_base_dirs
pkgver=6.0.1
pkgrel=1
pkgdesc="An implementation of the XDG Base Directory Specification in Python"
arch=('any')
url="https://github.com/srstevenson/xdg-base-dirs"
license=('ISC')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b4c8f4ba72d1286018b25eea374ec6fbf4fddda3d4137edf50de95de53e195a6')

prepare() {
  cd "$_name-$pkgver"
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

