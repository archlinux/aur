# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=coz-git
pkgver=r424.d87e924
pkgrel=1
pkgdesc="a new kind of profiler that measures optimization potential"
arch=('x86_64')
url="https://github.com/plasma-umass/coz"
license=('BSD')
depends=('python3' 'libelfin-git' 'npm')
makedepends=('git' 'python-docutils')
options=()
install=
source=('coz-git::git+https://github.com/plasma-umass/coz.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd $pkgname

  mkdir -p "$pkgdir/usr/share/man/man1"
  make prefix="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
