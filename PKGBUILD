# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Eduardo Parra Mazuecos <eduparra90@gmail.com>

_pyname=pyexcel-io
pkgname=python-$_pyname
pkgver=0.6.7.1
pkgrel=1
pkgdesc="One interface to read and write the data in various excel formats"
arch=(any)
url="https://github.com/pyexcel/pyexcel-io"
license=(BSD-3-Clause)
depends=(python-lml)
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2670c973250535e3e0467f0238d029f5e03a8480bf8b5e718b5ecdbba2b29e45')

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl
}
