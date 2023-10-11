# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-aiopath
_name=${pkgname#python-}
pkgver=0.6.13
pkgrel=1
pkgdesc="Asynchronous pathlib for Python"
arch=('any')
url="https://github.com/alexdelorenzo/aiopath"
license=('LGPL3')
depends=('python-aiofile' 'python-anyio')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
#source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba31a7483630882daf3d6fe671dcd650558c6c88f65e911ecadca2e07b2c7673')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
