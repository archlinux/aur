# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>

pkgname=gdmd-git
pkgver=r31.1a4bcb2
pkgrel=1
pkgdesc="DMD-like wrapper for GDC"
arch=('any')
url="https://github.com/D-Programming-GDC/gdmd"
license=('GPL')
provides=('gdmd')
conflicts=('gdmd')
depends=('perl')
makedepends=('git')
source=("git+https://github.com/D-Programming-GDC/GDMD.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/GDMD"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/GDMD"
  mkdir -p "$pkgdir"/usr/{bin,share/man/man1}
  make install prefix=/usr DESTDIR="$pkgdir"
}
