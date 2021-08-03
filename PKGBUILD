# Maintainer: phire <me@phire.cc>
pkgname=wgnord
pkgver=0.1.2
pkgrel=1
pkgdesc="A NordVPN Wireguard (\"NordLynx\") client in POSIX shell"
arch=('any')
url="https://git.phire.cc/me/wgnord"
depends=('jq' 'curl' 'wireguard-tools')
source=("git+https://git.phire.cc/me/wgnord.git")
source=("https://git.phire.cc/me/$pkgname/archive/$pkgver.tar.gz")
md5sums=("ee015e5cd283b3c9ac5cfd73c33b7cae")

package() {
	install -Dm644 "$srcdir/$pkgname/template.conf" "$pkgdir/var/lib/$pkgname/template.conf"
	install -Dm644 "$srcdir/$pkgname/countries.txt" "$pkgdir/var/lib/$pkgname/countries.txt"
	install -Dm755 "$srcdir/$pkgname/wgnord" "$pkgdir/usr/bin/wgnord"
}
