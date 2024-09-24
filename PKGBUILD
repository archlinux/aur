# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-ubelt
_pkgname=ubelt
pkgver=1.3.6
pkgrel=1
pkgdesc="A Python utility belt containing simple tools"
arch=('any')
url="https://github.com/Erotemic/ubelt"
license=('Apache')
depends=(python python-blake3 python-colorama python-dateutil python-pygments python-xxhash)
optdepends=()
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-xdoctest)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('327a516a1fc95595096727ae3ae879379bc56fc11fb945857b971ef85a74f698')

build(){
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package(){
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
  cd "$_pkgname-$pkgver"
  pytest ubelt
}

### vim:ts=2:sw=2:et:
