pkgname=pluto-find-orb-git
pkgver=r2387.1883203
pkgrel=1
pkgdesc="Orbit determination from observations"
arch=(x86_64)
url="https://www.projectpluto.com/find_orb.htm"
license=(GPL2)
makedepends=('git' 'pluto-lunar' 'pluto-sat-code' 'pluto-jpl-eph')
install=find-orb.install
source=("git+https://github.com/Bill-Gray/find_orb.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/find_orb"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/find_orb"
  make find_orb
}

package() {
  install -m755 -D "${srcdir}/${_pkgname}/find_orb"	"$pkgdir/usr/bin/${bin}"
}
