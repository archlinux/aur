pkgname=pluto-find-orb-git
pkgver=20230712.3ccabe5
pkgrel=2
pkgdesc="Orbit determination from observations"
arch=(x86_64)
url="https://www.projectpluto.com/find_orb.htm"
license=(GPL2)
makedepends=('meson' 'git' 'pluto-lunar' 'pluto-sat-code' 'pluto-jpl-eph')
source=("git+https://github.com/Bill-Gray/find_orb.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/find_orb"
  git log -1 --format='%cd.%h' --date=short --abbrev=7 | tr -d -
}

build() {
  cd "$srcdir/find_orb"
  make
}

package() {
  meson install -C build --destdir="$pkgdir"
}
