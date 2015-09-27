# Maintainer: Fabio Zanini <fabio DOOT zanini AAT fastmail DOOT fm>
pkgname=aliview
pkgver=1.17.1
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
source=("http://www.ormbunkar.se/"$pkgname"/downloads/linux/linux-version-$pkgver/$pkgname.tgz")
md5sums=('9fe3864788e73f76fcb055d7837a99a7')

build() {
	cd $srcdir
	sed -i "s|/usr|$pkgdir/usr|" install.sh
	sed -i 's|\[ -d ~/.local/share/applications \]|0|' install.sh
}


package() {
	cd "$srcdir"
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share
	./install.sh
}
