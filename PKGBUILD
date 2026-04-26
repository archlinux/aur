# Maintainer: Ken-ichi Yasuda <msredcomet06@gmail.com>
pkgname=mydns
pkgver=1.0.1
pkgrel=1
pkgdesc="MyDNS.JP IP update script with IPv4/IPv6 support and systemd timer"
arch=('any')
url="https://github.com/kenichyan/mydns"
license=('MIT')
depends=('bash' 'curl')
backup=('etc/mydns/mydns.conf')

source=("$pkgname-$pkgver.tar.gz::https://github.com/kenichyan/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac496ea4b19c1dda24955913f20fe7e5efb5d3e7d9069882bc9f0165cfd8d5e1')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 mydns-update.sh "$pkgdir/usr/bin/mydns-update"
    install -Dm600 mydns.conf "$pkgdir/etc/mydns/mydns.conf"
    install -Dm644 mydns-update.service "$pkgdir/usr/lib/systemd/system/mydns-update.service"
    install -Dm644 mydns-update.timer "$pkgdir/usr/lib/systemd/system/mydns-update.timer"
}
