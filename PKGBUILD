# Maintainer: Jonathan Neidel <aur at jneidel dot com>

pkgname=epr-git
pkgver=2.4.15.r154.723c77d
pkgrel=1
pkgdesc="CLI Epub Reader"
arch=(any)
url="https://github.com/wustho/epr"
license=(MIT)
depends=("ncurses")
makedepends=(git)
optdepends=()
provides=(epr)
conflicts=(epr)
source=("git+https://github.com/wustho/epr.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  printf "%s.r%s.%s" "$(grep -F '__version__ =' epr.py | awk -F\" '{print $2}')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname/-git/}"
  mkdir -p "$pkgdir/usr/bin"
  cp epr.py "$pkgdir/usr/bin/epr"
}
