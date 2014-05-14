# Contributor: greg+devel@marvid.fr
# Contributor: Jared Henley <multixrulz at users dot sourceforge dot net>
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>

pkgname=awb
pkgver=0.3.5
pkgrel=1
pkgdesc="AsciiDoc Website Builder - build a website using AsciiDoc markup"
arch=('any')
url='http://awb.sourceforge.net'
license='GPL'
depends=('python' 'asciidoc')
install=awb.install
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2/download
	http://$pkgname.sourceforge.net/awb-website.tar.bz2
	awb.conf)
noextract=('awb-website.tar.bz2')

md5sums=('b7f9bf1195b69f7186fa17c683b8fe49'
         'e86f2250f14c44c62d26cbc7d8059db3'
         'd41ef48ff0f0dd585661eb6dec540c5e')

package() {
	install -dm755 "$pkgdir/usr/share/awb/sample"
	tar -xjf awb-website.tar.bz2 -C "$pkgdir/usr/share/awb/sample"
	install -Dm645 awb.conf "$pkgdir/usr/share/awb/awb.conf"
	cd $pkgname-$pkgver
	install -Dm755 awb "$pkgdir/usr/bin/awb"
	install -m644 ChangeLog "$pkgdir/usr/share/awb/ChangeLog"
}
