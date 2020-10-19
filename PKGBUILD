# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
pkgname="nerdfetch"
pkgver=2
pkgrel=1
pkgdesc="A POSIX fetch using NerdFonts"
arch=('any')
optdepends=('bc: memory percent')
url="https://github.com/ThatOneCalculator/NerdFetch"
license=('GPL')
makedepends=('git')
source=("git+https://github.com/ThatOneCalculator/NerdFetch")
noextract=()
md5sums=('SKIP')

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