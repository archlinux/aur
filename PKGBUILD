# Maintainer: lsf
pkgname=python-unicode-slugify-git
_pkgbase=unicode-slugify
pkgver=r41.8a9c3dc
pkgrel=1
pkgdesc="A Python slugify application that handles unicode"
arch=(any)
url="https://github.com/mozilla/unicode-slugify"
license=('BSD')
makedepends=("python-setuptools" "git")
depends=("python" "python-unidecode" "python-six")
source=("git+https://github.com/mozilla/unicode-slugify")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbase"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgbase"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
