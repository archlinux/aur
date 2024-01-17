# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=holehe
pkgver=1.61
_commit=f7d151c49cafd958c3adb4d75aacca549315ce23
pkgrel=3
pkgdesc="Check if an email address is used on different sites"
arch=(any)
url="https://github.com/megadose/holehe"
license=(GPL-3.0-only)
depends=(
  python
  python-beautifulsoup4
  python-httpx
  python-termcolor
  python-tqdm
  python-trio
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('b09aa0c94255702cd6ada02a47e48bb900f16fa0e4a025ec06a90e620e49661a')

_archive="$pkgname-$_commit"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
