# Maintainer: Luc <luc@dougy147.com>
pkgname=scitopdf
pkgver=0.3
pkgrel=1
pkgdesc="bash script to quickly fetch, download and open scientific papers from Sci-Hub's database."
arch=(x86_64 i686)
url="https://github.com/dougy147/scitopdf.git"
license=('GPL3')
depends=(zathura)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(scitopdf)
conflicts=()
replaces=()
source=("${pkgname}::git+${url}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname" || exit
	printf "0.3.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -D -m755 "$srcdir/$pkgname/bin/scitopdf" "$pkgdir/usr/bin/scitopdf"
	install -D -m644 "$srcdir/$pkgname/scitopdf.1" "$pkgdir/usr/share/man/man1/scitopdf.1"
}
