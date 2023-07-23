pkgname=pluto-find-orb-git
pkgver=r2376.ec12feb
pkgrel=1
pkgdesc="Orbit determination from observations"
arch=(x86_64)
url="https://www.projectpluto.com/find_orb.htm"
license=(GPL2)
makedepends=('meson' 'git' 'pluto-lunar' 'pluto-sat-code' 'pluto-jpl-eph')
source=("git+https://github.com/Bill-Gray/find_orb.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/find_orb"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/find_orb"
  make
}

package() {
  meson install -C build --destdir="$pkgdir"
}
