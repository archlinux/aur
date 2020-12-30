
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=shellect-git
_pkgname=${pkgname%-*}
pkgver=r19.c920ab5
pkgrel=1
pkgdesc='Selection system written in POSIX shell.'
arch=('any')
url='https://github.com/huijunchen9260/shellect'
license=('GPL3')
provides=('shellect')
conflicts=('shellect')
source=("git+https://github.com/huijunchen9260/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 'shellect' -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$_pkgname"
}

