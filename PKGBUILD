# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgname=remind-agenda-git
pkgver=r11.cf4cd6f
pkgrel=1
pkgdesc="Interactive terminal interface for the calendar program 'remind'"
arch=('any')
url="https://gitlab.com/dkabus/remind-agenda"
license=('GPL')
groups=()
depends=('remind' 'python' 'python-colorama' 'python-termcolor')
makedepends=('git' 'make')
provides=('remind-agenda')
conflicts=('remind-agenda')
replaces=()
backup=()
options=()
install=
source=('remind-agenda-git::git+https://gitlab.com/dkabus/remind-agenda')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
