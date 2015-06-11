# Maintainer: Max Bruckner
pkgname=lampe
pkgver=1.0.4
pkgrel=1
pkgdesc="Interactive bash-script to control your Philips Hue lights."
arch=("any")
url="https://github.com/poinck/lampe"
license=('custom')
depends=( 'curl' 'bc' 'zenity' 'json-sh' )
source=( "git+https://github.com/poinck/${pkgname}#tag=$pkgver"
)
md5sums=( SKIP )

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
	install -d -m 755 "$pkgdir/usr/share/licenses/lampe"
	install -m 644 LICENSE "$pkgdir/usr/share/licenses/lampe/CC0"
}
