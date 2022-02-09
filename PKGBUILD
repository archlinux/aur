# Maintainer: phire <me@phire.cc>
pkgname=wgnord
pkgver=0.1.10
pkgrel=1
pkgdesc="A NordVPN Wireguard (\"NordLynx\") client in POSIX shell"
arch=('any')
url="https://git.phire.cc/me/wgnord"
depends=('jq' 'curl' 'wireguard-tools' 'openresolv')
source=("https://git.phire.cc/$pkgname/snapshot/$pkgname-$pkgver.tar.gz")
md5sums=("3d84a9e8d3d7233c4a6fa03266355f00")
backup=(var/lib/wgnord/template.conf)

package() {
	install -Dm644 "$srcdir/$pkgname-$pkgver/template.conf" "$pkgdir/var/lib/$pkgname/template.conf"
	install -Dm644 "$srcdir/$pkgname-$pkgver/countries.txt" "$pkgdir/var/lib/$pkgname/countries.txt"
	install -Dm644 "$srcdir/$pkgname-$pkgver/countries_iso31662.txt" "$pkgdir/var/lib/$pkgname/countries_iso31662.txt"
	install -Dm755 "$srcdir/$pkgname-$pkgver/wgnord" "$pkgdir/usr/bin/wgnord"
}
