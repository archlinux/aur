# Maintainer: gilbus <aur (AT) tinkershell dot eu>
pkgname=python-xdg-base-dirs
_name=xdg_base_dirs
pkgver=6.0.2
pkgrel=1
pkgdesc="An implementation of the XDG Base Directory Specification in Python"
arch=('any')
url="https://github.com/srstevenson/xdg-base-dirs"
license=('ISC')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('950504e14d27cf3c9cb37744680a43bf0ac42efefc4ef4acf98dc736cab2bced')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

