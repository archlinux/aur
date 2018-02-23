# Maintainer: Fabio Zanini <fabio DOOT zanini AAT fastmail DOOT fm>
pkgname=aliview
pkgver=1.21
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
md5sums=('049cccf1438c886b7a2b2d4fedd3a4ba')

build() {
	cd $srcdir
	sed -i "s|/usr|$pkgdir/usr|" install.sh
	sed -i 's|\[ -d ~/.local/share/applications \]|false|' install.sh
}


package() {
	cd "$srcdir"
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share
	./install.sh
}
