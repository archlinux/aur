pkgname=colorcvs
pkgver=0.3.1
pkgrel=2
pkgdesc="CVS output colorizer"
arch=('any')
url="http://www.console-colors.de/index.php?n=ColorizerTools.ColorCVS"
license=('GPL2')
depends=('cvs' 'perl')
backup=("etc/${pkgname}rc"
        "etc/profile.d/$pkgname-env.sh")
source=("http://www.console-colors.de/downloads/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('f7220b672c608e52bebb225c2f8f37c0')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make $pkgname
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# vim: set ft=sh ts=4 sw=4 noet:
