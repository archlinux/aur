# Maintainer: Luke Collins <luke@collins.mt>
pkgname=bibbja
pkgver=1
pkgrel=1
pkgdesc="Maltese Catholic Bible in the terminal - Bibbja bil-Malti"
arch=(any)
url="https://github.com/drmenguin/bibbja"
license=('GPL')
depends=(bash)
source=('bibbja::git+https://github.com/drmenguin/bibbja')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf 1 #"r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 bibbja $pkgdir/usr/bin/bibbja
}
