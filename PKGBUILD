# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>

_pkgname=xarray-einstats
pkgname=python-$_pkgname
pkgver=0.3.0
pkgrel=1
pkgdesc='Stats, linear algebra and einops for xarray'
arch=('any')
url='https://einstats.python.arviz.org'
license=('Apache')
depends=('python-scipy' 'python-xarray' 'python-pytest')
makedepends=('python-poetry' 'python-build' 'python-installer'
             'python-flit-core')
optdepends=('python-numba' 'python-dask' 'python-einops')
source=($pkgname-$pkgver.tar.gz::"https://github.com/arviz-devs/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6231c6df75c2d0ef9e930be12897d0075383563f244832982c3a09544853def9')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
