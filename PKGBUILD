# Maintainer: Fabio Zanini <fabio DOOT zanini AAT fastmail DOT fm>
pkgname=aliview
pkgver=1.25
pkgrel=1
pkgdesc="Software for aligning viewing and editing dna/aminoacid sequences."
arch=('any')
url="http://www.ormbunkar.se/aliview/"
license=('GPL')
depends=('jre')
makedepends=()
optdepends=()
options=()
install=
changelog=
source=("http://www.ormbunkar.se/${pkgname}/downloads/linux/linux-version-$pkgver/$pkgname.tgz")
sha256sums=('948cc4d8de80801d8aa3bf48e81957731374ab12bd55a1618621e2e65dbdc3a8')

build() {
	cd "$srcdir/aliview"
	sed -i "s|/usr|$pkgdir/usr|" install.sh
	sed -i 's|\[ -d ~/.local/share/applications \]|false|' install.sh
}


package() {
	cd "$srcdir/aliview"
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share
	./install.sh
}
