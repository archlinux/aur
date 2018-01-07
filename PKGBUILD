# Maintainer: Uzerus <szymonscholz at gmail dot com>
# Previous Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Previous Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=coffeelint
pkgver=2.0.6
pkgrel=1
pkgdesc="Style checker for CoffeeScript"
arch=(any)
url="http://www.coffeelint.org/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=("https://github.com/clutchski/coffeelint/archive/v2.0.6.tar.gz")

prepare() {
	mv $srcdir/v2.0.6.tar.gz $srcdir/$pkgname-$pkgver 

}

package() {
	cd $srcdir/$pkgname-$pkgver
	npm install -g --user root --prefix="$pkgdir/usr"		

	rm -rf $pkgdir/usr/etc/

	find "$pkgdir/usr" -type d -exec chmod 755 '{}' + #fix bug https://bugs.archlinux.org/task/56962

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('f5ff8853b9a53e5facab76d8420c5548')
