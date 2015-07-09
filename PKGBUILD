# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Joel Almeida <aullidolunar at gmail dot c0m>

pkgname=fluxmod-styles
pkgver=1
pkgrel=5
pkgdesc="All of the fluxbox styles from the deceased fluxmod.dk site"
arch=('any')
url="http://tenr.de/styles/"
license=('CC BY-SA 3.0')
depends=('fluxbox')
source=("http://tenr.de/styles/archives/fluxmod-styles-pkg.tar.bz2")
md5sums=('75140735ad4e014365a57b30be4c1911')

build() {
	cd "$srcdir"
}

package() {
	cd "$srcdir/fluxmod-styles-pkg"
	install -dm755 "$pkgdir/usr/share/fluxbox/styles"
	install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm License.txt
	rm delfont.sh
	# selected themes are by default in fluxbox, remove them
	rm -rf Emerge
	find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/fluxbox/styles/{}" \;
}
