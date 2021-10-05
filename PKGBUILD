# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=penelope-git
pkgver=0.8.r7.b6fda51
pkgrel=1
pkgdesc='Penelope shell handler'
arch=('any')
license=('GPL3')
url="https://github.com/brightio/penelope"
depends=('python')
makedepends=('git')
conflicts=('penelope')
provides=('penelope')
source=('git+https://github.com/brightio/penelope.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/penelope"
	printf "%s.r%s.%s" \
		"$(python -c 'from penelope import __version__; print(__version__)')" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/penelope"
	install -Dm755 penelope.py "$pkgdir/usr/bin/penelope"
}
