# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-konsole-git
_pkgname=Sweet-kde
pkgver=r50.0feee61
pkgrel=1
pkgdesc="Sweet KDE color scheme for Konsole"
arch=('any')
url="https://github.com/Gigas002/$_pkgname"
license=('GPL-3.0-or-later')
makedepends=(
	'git'
)
depends=(
	'konsole'
)
provides=("sweet-konsole=$pkgver")
conflicts=('sweet-konsole')
source=("git+$url.git#branch=plasma-6-migration")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	# konsole color schemes
	install -Dm644 -t "$pkgdir/usr/share/konsole" \
		"$srcdir/$_pkgname/konsole/"*.colorscheme
}
