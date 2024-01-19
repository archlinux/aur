# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='wd5741'
pkgver='20131220'
pkgrel='3'
pkgdesc='Firmware update utility for WD Red drives'
arch=('x86_64' 'i686' 'pentium4')
url='https://support-cz.wd.com/app/products/product-detailweb/p/288'
license=('LicenseRef-WDDisclaimerofLiability')
source=("$pkgname-$pkgver.zip::https://downloads.wdc.com/sata/${pkgname^^}v4.zip")
sha512sums=('cc81b0f1ea0e92042b870d8484449d30a89b4d55230d24944f560a0cfb8fbd34cb754bd719cf5593ba79d022ef50718b8c4d9c37381d752e141d6e3c90b1f3f9')

package() {
	case "$CARCH" in
		i686|pentium4)
			install -Dm755 "$srcdir/${pkgname}x32" "$pkgdir/usr/bin/$pkgname"
		;;
		*)
			install -Dm755 "$srcdir/${pkgname}x64" "$pkgdir/usr/bin/$pkgname"
		;;
	esac

	install -Dm644 'Disclaimer of Liability - As-Is.txt' "$pkgdir/usr/share/licenses/$pkgname/WDDisclaimerofLiability"
}
