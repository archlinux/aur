# Contributor: greg+devel@marvid.fr
# Contributor: Jared Henley <multixrulz at users dot sourceforge dot net>
# Contributor: Anton Leontiev <scileont /at/ gmail.com>

pkgname=awb
pkgver=0.3.5
pkgrel=2
pkgdesc="AsciiDoc Website Builder - build a website using AsciiDoc markup"
arch=('any')
url='https://jared.henley.id.au/software/awb/'
license=('GPL')
depends=('python' 'asciidoc')
install=awb.install
source=(https://jared.henley.id.au/software/awb/download/$pkgname-$pkgver.tar.bz2
	awb.conf)

md5sums=('b7f9bf1195b69f7186fa17c683b8fe49'
         'd41ef48ff0f0dd585661eb6dec540c5e')

package() {
	install -Dm645 awb.conf "$pkgdir/usr/share/awb/awb.conf"
	cd $pkgname-$pkgver
	install -Dm755 awb "$pkgdir/usr/bin/awb"
	install -m644 ChangeLog "$pkgdir/usr/share/awb/ChangeLog"
}
