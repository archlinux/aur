# Maintainer: Max Bruckner
pkgname=lampe-bash
pkgver=1.1.10
pkgrel=4
pkgdesc="Interactive bash-script to control your Philips Hue lights."
arch=("x86_64" "i686")
url="https://gitlab.com/poinck/lampe/"
license=('custom')
depends=('curl' 'bc' 'json-sh')
optdepends=('redshift')
conflicts=('lampe<1.1.8-2')
source=( "git+https://gitlab.com/poinck/${pkgname/-bash/}.git#tag=$pkgver"
)
md5sums=( SKIP )

package() {
	cd "$srcdir/${pkgname/-bash/}"
	install -d -m 755 "$pkgdir/usr/bin"
	install -m 755 lampe "$pkgdir/usr/bin/"

	install -d -m 755 "$pkgdir/usr/share/licenses/lampe"
	install -m 644 LICENSE "$pkgdir/usr/share/licenses/lampe/CC0"
}
