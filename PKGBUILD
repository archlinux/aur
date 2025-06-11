# Maintainer: picokan <todaysoracvle@protonmail.com>

pkgname=immich-runit
pkgver=20250611
pkgrel=1
pkgdesc="Runit service script for immich."
arch=("any")
url="https://github.com/immich-app/immich"
license=("MIT")
depends=("immich-server" "runit")
source=("immich-server.run" "immich-mchn-learning.run" "immich-server.log.run"
    "immich-mchn-learning.log.run" "immich-server.finish")
sha256sums=('42b34fd473de63c0d6dd1a1d485470edca27dd833c6241529b9c62d1a60ff2da'
            '84fce44b4e99065c217e770b36e268467e2f6366d5c71a510f27ae0066deedf4'
            '05ba3babe01cd51841631a606f67736397854167f0c828bb1346d17d904f84a9'
            'fd5a93f8d5db75c5cac1c7b5ce5b786ff3bb2b276e829a9a8c901124dbc9e28f'
            'a79e9fffb0eb748ce306638a41d5fb023cde34d5407579fbf5976568040e9f11')

package() {
	cd "$srcdir"
	install -Dm755 immich-server.run "$pkgdir/etc/runit/sv/immich-server/run"
	install -Dm755 immich-server.log.run "$pkgdir/etc/runit/sv/immich-server/log/run"
	install -Dm755 immich-mchn-learning.run "$pkgdir/etc/runit/sv/immich-mchn-learning/run"
	install -Dm755 immich-mchn-learning.log.run "$pkgdir/etc/runit/sv/immich-mchn-learning/log/run"
	install -Dm755 immich-server.finish "$pkgdir/etc/runit/sv/immich-server/finish"
}
