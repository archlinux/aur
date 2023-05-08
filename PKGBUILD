# Maintainer: articpenguin <julia.schweinz at mailfence dot com>

pkgname=modernish
pkgver=0.16.5
pkgrel=1
pkgdesc="POSIX compliant shell script library for modern, robust, portable, readable shell code"
arch=(any)
url='https://github.com/modernish/modernish'
license=('ISC')
depends=(
 sed
 awk
)
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0964bbe0fe0b24eecf62dfbef089710358d468c1eb09e2d48008ca7753beb8e1')

package() {

	cd "$srcdir/$pkgname-$pkgver"

	install -d "$pkgdir/usr/bin"

	install -d "$pkgdir/opt/$pkgname"

	./install.sh -n -s /bin/sh -d "$pkgdir/opt/$pkgname"
	
	ln -s "/opt/modernish/bin/modernish" "$pkgdir/usr/bin/modernish"
	
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
