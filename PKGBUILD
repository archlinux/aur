# Maintainer: Fabio Zanini <fabio DOOT zanini AAT fastmail DOT fm>
pkgname=aliview-bin
_pkgname=aliview
pkgver=1.27
pkgrel=1
pkgdesc="Software for aligning viewing and editing dna/aminoacid sequences."
arch=('any')
url="http://www.ormbunkar.se/aliview/"
license=('GPL')
depends=('jre-openjdk')
makedepends=()
optdepends=()
options=()
install=
changelog=
source=("http://www.ormbunkar.se/${_pkgname}/downloads/linux/linux-version-$pkgver/$_pkgname.tgz")
sha256sums=('c1ae05b949673540cf23cb6ebbcdc16689ae9c00ab528975f0665503440bdcd5')

build() {
	cd "$srcdir/$_pkgname"
	sed -i "s|/usr|$pkgdir/usr|" install.sh
	sed -i 's|\[ -d ~/.local/share/applications \]|false|' install.sh
}


package() {
	cd "$srcdir/$_pkgname"
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share
	./install.sh
}
