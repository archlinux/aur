# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=texttest
pkgver=4.3.1
pkgrel=1
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
sha256sums=('d15c75b8262d6ba9a60320801a03b59b9d33b6d28c62348c33255497aaad8e7f')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
