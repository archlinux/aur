# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=texttest
pkgver=4.3.0
pkgrel=2
pkgdesc="A tool for text-based functional testing"
arch=(any)
url="https://github.com/texttest/texttest"
license=(LGPL)
depends=(
  gdk-pixbuf2
  gobject-introspection-runtime 
  gtk3
  pango
  python
  python-boto
  python-certifi
  python-gobject
  python-matplotlib
  python-pillow
  python-psutil
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bc027b833cccf9043179accbb7e3fb876649c9eaffd25b62a00a1655c58ff320')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
