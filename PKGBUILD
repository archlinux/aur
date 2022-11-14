# Maintainer: hu3rror<hu3rror@protonmail.com>

pkgname=bspwm-gnome-git
pkgver=r110.1665f4f
pkgrel=2
pkgdesc="Use bspwm with GNOME Session integration."
arch=('any')
url="https://github.com/hu3rror/bspwm-gnome"
license=('MIT')
depends=(
	'bspwm'
	'gnome-session'
	'gnome-settings-daemon'
)
optdepends=(
	'gdm'
	'gnome-flashback'
)
source=($pkgname::git+https://github.com/hu3rror/bspwm-gnome.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir" install
}

