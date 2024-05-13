# Maintainer: phire <me@phire.cc>
pkgname=wgnord
pkgver=0.2.1
pkgrel=1
pkgdesc="A NordVPN Wireguard (\"NordLynx\") client in POSIX shell"
arch=('any')
url="https://github.com/phirecc/wgnord"
depends=('jq' 'curl' 'wireguard-tools' 'openresolv')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=('e73e348459591e3901c4db1dfbdc2938')
backup=(var/lib/wgnord/template.conf)

package() {
	install -Dm644 "$srcdir/$pkgname-$pkgver/template.conf" "$pkgdir/var/lib/$pkgname/template.conf"
	install -Dm644 "$srcdir/$pkgname-$pkgver/countries.txt" "$pkgdir/var/lib/$pkgname/countries.txt"
	install -Dm644 "$srcdir/$pkgname-$pkgver/countries_iso31662.txt" "$pkgdir/var/lib/$pkgname/countries_iso31662.txt"
	install -Dm755 "$srcdir/$pkgname-$pkgver/wgnord" "$pkgdir/usr/bin/wgnord"
}
