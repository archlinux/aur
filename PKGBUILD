# Maintainer: Fabio Zanini <fabio DOOT zanini AAT fastmail DOT fm>
pkgname=aliview
pkgver=1.26
pkgrel=2
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
source=("http://www.ormbunkar.se/${pkgname}/downloads/linux/linux-version-$pkgver/$pkgname.tgz")
sha256sums=('29c91075fac224b0150ceafc28fe0f0397f5659e9c14646903fa79ecdaafeac5')

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
