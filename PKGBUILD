# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>
pkgname=remind-agenda-git
pkgver=r1.8e22869
pkgrel=1
pkgdesc="Interactive terminal interface for the calendar program 'remind'"
arch=('any')
url="https://www.kabus.eu/git/remind-agenda"
license=('GPL')
groups=()
depends=('remind' 'python' 'python-colorama' 'python-termcolor')
makedepends=('git')
provides=('remind-agenda')
conflicts=('remind-agenda')
replaces=()
backup=()
options=()
install=
source=('remind-agenda-git::git://www.kabus.eu/git/remind-agenda')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"

# Git, tags available
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# prepare() {
# 	cd "$srcdir/${pkgname}"
# }

# build() {
# 	cd "$srcdir/${pkgname}"
# 	make
# }

# check() {
# 	cd "$srcdir/${pkgname}"
# 	make -k check
# }

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
