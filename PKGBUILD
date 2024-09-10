# Maintainer: phire <me@phire.cc>
pkgname=wgnord
pkgver=0.2.2
pkgrel=1
pkgdesc="A NordVPN Wireguard (\"NordLynx\") client in POSIX shell"
arch=('any')
url="https://github.com/phirecc/wgnord"
depends=('jq' 'curl' 'wireguard-tools' 'openresolv')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0ed3fb12d2ba68932227f9f2be0dc5f40f7dbfaf46655dc2c516d999a8564f6c')
backup=(var/lib/wgnord/template.conf)

package() {
	install -Dm644 "$srcdir/$pkgname-$pkgver/template.conf" "$pkgdir/var/lib/$pkgname/template.conf"
	install -Dm644 "$srcdir/$pkgname-$pkgver/countries.txt" "$pkgdir/var/lib/$pkgname/countries.txt"
	install -Dm644 "$srcdir/$pkgname-$pkgver/countries_iso31662.txt" "$pkgdir/var/lib/$pkgname/countries_iso31662.txt"
	install -Dm755 "$srcdir/$pkgname-$pkgver/wgnord" "$pkgdir/usr/bin/wgnord"
}
