# Maintainer: Luc <luc@dougy147.com>
pkgname=scitopdf
pkgver=0.4
pkgrel=1
epoch=
pkgdesc="bash script to quickly fetch, download and open scientific papers from Sci-Hub's database."
arch=(x86_64 i686)
url="https://github.com/dougy147/scitopdf.git"
license=('GPL3')
groups=()
depends=(zathura)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(scitopdf)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "0.3.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -D -m755 "$srcdir/$pkgname/bin/scitopdf" "$pkgdir/usr/bin/scitopdf"
	install -D -m644 "$srcdir/$pkgname/scitopdf.1" "$pkgdir/usr/share/man/man1/scitopdf.1"
}
