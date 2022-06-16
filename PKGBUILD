# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=scitopdf-git
pkgver="r113.91b7463"
pkgrel=1
pkgdesc="bash script to quickly fetch, download and open scientific papers from Sci-Hub's database"
arch=(x86_64)
url="https://github.com/dougy147/scitopdf"
license=(GPL3)
conflicts=()
provides=('scitopdf')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname" || exit
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -D -m755 "$srcdir/$pkgname/bin/scitopdf" "$pkgdir/usr/bin/scitopdf"
	install -D -m644 "$srcdir/$pkgname/scitopdf.1" "$pkgdir/usr/share/man/man1/scitopdf.1"
}
