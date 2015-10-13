# Maintainer: flu

_name="yank"
pkgname="$_name-git"
pkgver=0.4.0.1.gd8db62a
pkgrel=1
pkgdesc="Yank (copy) terminal output to clipboard"
arch=('i686' 'x86_64')
url="https://github.com/mptre/yank"
license=("MIT")
depends=("xsel")
makedepends=("git")
provides=("$_name")
conflicts=("$_name")
source=(git+$url)
sha512sums=(SKIP)

pkgver() {
  cd   "$srcdir/$_name"
  git describe --tags | sed 's/^v//; s/-/./g'
}

build() {
  cd  "$srcdir/$_name"
  make
}

package() {
  cd  "$srcdir/$_name"
  PREFIX="$pkgdir"/usr make install
}
