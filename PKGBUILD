# Maintainer: Nikhil Singh <nik.singh710@gmail.com>
pkgname=getnf
pkgver=r75.433810e
pkgrel=1
pkgdesc="Simple utility to install nerd fonts in system."
arch=("any")
url="https://github.com/getnf/getnf"
license=('GPL3')
makedepends=("git")
depends=(
  curl
  fontconfig
  ncurses
  unzip
)
source=("git+https://github.com/getnf/getnf.git")
md5sums=('SKIP')
provides=('getnf')
conflicts=('getnf')

pkgver() {
	cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm755 ./getnf "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 ./LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim: ft=PKGBUILD
