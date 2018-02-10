# Maintainer: kodemeister <kodemeister@outlook.com>

_pkgname=compdb
pkgname=$_pkgname-git
pkgver=143.7a77fec
pkgrel=1
pkgdesc="The compilation database Swiss army knife"
arch=("any")
url="https://github.com/Sarcasm/$_pkgname"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("$_pkgname")
source=("git+https://github.com/Sarcasm/$_pkgname.git")
md5sums=("SKIP")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
