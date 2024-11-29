# Maintainer: Eric Torres <eric.torres@its-et.me>
pkgname=podcheck
pkgver=0.5.6.1
pkgrel=1
pkgdesc="CLI tool to automate podman image updates. Selective, notifications, autoprune, no pre-pulling."
arch=('any')
url="https://github.com/sudo-kraken/podcheck"
license=('GPL-3.0-only')
depends=(bash podman podman-compose jq regclient-regctl)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sudo-kraken/podcheck/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7d9f5c9985484454e5d1146c7dfba75bb7d06dd7871b30401a6418ac635d6d9a')

package() {
	cd "$pkgname-$pkgver"
    install -D podcheck.sh $pkgdir/usr/bin/$pkgname
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -D README.md $pkgdir/usr/share/doc/$pkgname/README.md
	install -D notify_templates/notify*.sh -t $pkgdir/usr/share/$pkgname/
}
