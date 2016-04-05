pkgname=devilspie2
pkgver=0.41
pkgrel=1
pkgdesc="A window matching utility, allowing the user to perform scripted actions on windows as they are created."
arch=('i686' 'x86_64')
url="http://www.gusnan.se/$pkgname/"
license=('GPL3')
depends=('lua>=5.1' 'gtk3' 'libwnck3')
source=("http://download.savannah.gnu.org/releases/$pkgname/${pkgname}_$pkgver-src.tar.gz"{,.asc})
md5sums=('ce87fd9f27cfb0a74fe2c2360e08d8ef'
         'SKIP')
validpgpkeys=('DB306E4B10FFD98EF4DB55D7194B631AB2DA2888') # Andreas Rönnquist <gusnan@gusnan.se>

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX=/usr install

	# Install documentation
	install -o root -g root -m 644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim: set ft=sh ts=4 sw=4 noet:
