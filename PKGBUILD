# Maintainer: Dct Mei <dctxmei@gmail.com>
pkgname=aria2-systemd
pkgver=1.0
pkgrel=1
pkgdesc="Systemd unit setting a Aria2 Service"
arch=('any')
depends=('aria2')
source=("aria2.service")
sha512sums=('e21bfeb353a8ab8b1879bbe8e6015ba9517c0c570f5c90f81b78e40365a8341ec1156321ee760af3d906ece26608da2601e2638e6e62848948f4e8e7c525f0d5')

package() {
    install -Dm644 "$srcdir"/aria2.service "$pkgdir"/usr/lib/systemd/system/aria2.service
    sed 's/\/etc/%h\/.config/g' aria2.service -i
    install -Dm644 "$srcdir"/aria2.service "$pkgdir"/usr/lib/systemd/user/aria2.service
}
