# Maintainer: masutu < masutu dot arch at gmail dot com >

pkgname=python-pyesorex
_pkgname=${pkgname#python-}
pkgver=1.0.4
pkgrel=1
pkgdesc="A CPL recipe execution tool that complements the PyCPL library"
arch=(x86_64)
url="https://www.eso.org/sci/software/pycpl/"
license=(GPL-3.0-only.txt)
depends=(python-pycpl)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("https://ftp.eso.org/pub/dfs/pipelines/libraries/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('b75aab4bac3fe87f4c00093cd988efd96d548f3f4f7325fef54229d4c89a9097')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

