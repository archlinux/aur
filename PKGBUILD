# Maintainer: MajorX234 <majorx234@googlemail.com>

pkgname=python-pathschema
_pkgname=pathschema
pkgver=0.2.1
pkgrel=1
pkgdesc='Python path schema validation'
arch=(any)
url='https://github.com/Apollo-Roboto/python-pathschema.git'
license=(MIT)
depends=(
  python
)

makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-pylint
  python-colorama
)
_commit=90627c7a575766c8b7dd5b215405a8f8ee0d2922
source=("$_pkgname::git+$url#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/"$_pkgname"
  rm  dist -rf
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/"$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
