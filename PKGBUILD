# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=ntpstat
pkgver=0.6
pkgrel=2
pkgdesc="Print NTP synchronisation status for ntpd or chronyd"
arch=("any")
url="https://github.com/mlichvar/ntpstat"
license=("MIT")
depends=("bash")
optdepends=("chrony: chronyd support"
			"ntp: ntpd support")
options=("zipman")
changelog=NEWS
source=("https://github.com/mlichvar/ntpstat/archive/refs/tags/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("366b146133c71cf3e63c50ee75fd6a0c2e7763b8d239c6ef6f22333be57b13f7")

package() {
	cd "$pkgname-$pkgver"
	install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -D -p -m 644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
