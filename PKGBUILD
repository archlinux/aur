# Maintainer: phire <me@phire.cc>
pkgname=mlvd
pkgver=0.3
pkgrel=1
pkgdesc="A Mullvad Wireguard client in POSIX shell"
arch=('any')
url="https://github.com/phirecc/mlvd"
depends=('jq' 'curl' 'wireguard-tools' 'openresolv')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=("d6b707afd7172232e331445287a5c8ef")
backup=(var/lib/mlvd/template.conf)

package() {
	install -Dm600 "$srcdir/$pkgname-$pkgver/template.conf" "$pkgdir/var/lib/$pkgname/template.conf"
	install -Dm755 "$srcdir/$pkgname-$pkgver/mlvd" "$pkgdir/usr/bin/mlvd"
}
