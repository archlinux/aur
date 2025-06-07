# Maintainer: Eric Torres <eric.torres@its-et.me>
pkgname=podcheck
pkgver=0.6.0
pkgrel=1
pkgdesc="CLI tool to automate podman image updates. Selective, notifications, autoprune, no pre-pulling."
arch=('any')
url="https://github.com/sudo-kraken/podcheck"
license=('GPL-3.0-only')
depends=(bash podman podman-compose jq regclient-regctl)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sudo-kraken/podcheck/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('420b4eda119080d3287c1d3172c33e78fc01ebf24e0cd463b3a761d450c48b02')

package() {
	cd "$pkgname-$pkgver"
    install -D podcheck.sh $pkgdir/usr/bin/$pkgname
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -D README.md $pkgdir/usr/share/doc/$pkgname/README.md
	install -D notify_templates/notify*.sh -t $pkgdir/usr/share/$pkgname/
}
