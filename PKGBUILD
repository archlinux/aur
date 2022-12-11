# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>

_pkgname=xarray-einstats
pkgname=python-$_pkgname
pkgver=0.4.0
pkgrel=1
pkgdesc='Stats, linear algebra and einops for xarray'
arch=('any')
url='https://einstats.python.arviz.org'
license=('Apache')
depends=('python-scipy' 'python-xarray' 'python-pytest')
makedepends=('python-poetry' 'python-build' 'python-installer'
             'python-flit-core')
optdepends=('python-dask')
checkdepends=('python-numba' 'python-einops')
source=($pkgname-$pkgver.tar.gz::"https://github.com/arviz-devs/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('972d3aa80877ad69d1920b17ad1b4eb07122e38f5dbac2a2881ea361d6f32a2a')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
