# Maintainer: phire <me@phire.cc>
pkgname=wgnord
pkgver=0.1.9
pkgrel=2
pkgdesc="A NordVPN Wireguard (\"NordLynx\") client in POSIX shell"
arch=('any')
url="https://git.phire.cc/me/wgnord"
depends=('jq' 'curl' 'wireguard-tools' 'openresolv')
source=("https://git.phire.cc/me/$pkgname/archive/$pkgver.tar.gz")
md5sums=("a9da893c14ae058d2bc1be6c77652346")
backup=(var/lib/wgnord/template.conf)

package() {
	install -Dm644 "$srcdir/$pkgname/template.conf" "$pkgdir/var/lib/$pkgname/template.conf"
	install -Dm644 "$srcdir/$pkgname/countries.txt" "$pkgdir/var/lib/$pkgname/countries.txt"
	install -Dm755 "$srcdir/$pkgname/wgnord" "$pkgdir/usr/bin/wgnord"
}
