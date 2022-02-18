# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
pkgname="nerdfetch"
pkgver=4.3
pkgrel=1
pkgdesc="A POSIX fetch using NerdFonts"
arch=('any')
depends=('bc')
url="https://github.com/ThatOneCalculator/NerdFetch"
license=('GPL')
makedepends=('git')
source=("git+https://github.com/ThatOneCalculator/NerdFetch")
noextract=()
md5sums=('SKIP')

# pkgver() {
#	cd NerdFetch
#	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
# }

prepare() {
	if ! which dc &> /dev/null; then
		echo "Looks like you don't have bc (or your path is wonky)! The program will work, but you won't get the memory percent."
	fi
	cd NerdFetch
}

package() {
	install -Dm755 "$srcdir"/NerdFetch/nerdfetch "$pkgdir/usr/bin/nerdfetch"
	install -Dm644 "$srcdir"/NerdFetch/README.md "$pkgdir/usr/share/doc/$pkgname"
}
