# Maintainer: Max Bruckner
pkgname=lampe-bash
pkgver=1.1.7
pkgrel=1
pkgdesc="Interactive bash-script to control your Philips Hue lights."
arch=("x86_64" "i686")
url="https://github.com/poinck/lampe"
license=('custom')
depends=('curl' 'bc' 'json-sh')
optdepends=('redshift')
provides=('lampe')
conflicts=('lampe')
source=( "git+https://github.com/poinck/${pkgname/-bash/}#tag=$pkgver"
)
md5sums=( SKIP )

package() {
	cd "$srcdir/${pkgname/-bash/}"
	install -d -m 755 "$pkgdir/usr/bin"
	install -m 755 lampe "$pkgdir/usr/bin/"

	install -d -m 755 "$pkgdir/usr/share/licenses/lampe"
	install -m 644 LICENSE "$pkgdir/usr/share/licenses/lampe/CC0"
}
