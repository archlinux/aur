# Maintainer: phire <me@phire.cc>
pkgname=wgnord
pkgver=0.1.10
pkgrel=2
pkgdesc="A NordVPN Wireguard (\"NordLynx\") client in POSIX shell"
arch=('any')
url="https://github.com/phirecc/wgnord"
depends=('jq' 'curl' 'wireguard-tools' 'openresolv')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=("5153dcc43e828ef5ffca4769c6ce545d")
backup=(var/lib/wgnord/template.conf)

package() {
	install -Dm644 "$srcdir/$pkgname-$pkgver/template.conf" "$pkgdir/var/lib/$pkgname/template.conf"
	install -Dm644 "$srcdir/$pkgname-$pkgver/countries.txt" "$pkgdir/var/lib/$pkgname/countries.txt"
	install -Dm644 "$srcdir/$pkgname-$pkgver/countries_iso31662.txt" "$pkgdir/var/lib/$pkgname/countries_iso31662.txt"
	install -Dm755 "$srcdir/$pkgname-$pkgver/wgnord" "$pkgdir/usr/bin/wgnord"
}
