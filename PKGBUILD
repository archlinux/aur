# Maintainer: Eric Torres <eric.torres@its-et.me>
pkgname=podcheck
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI tool to automate podman image updates. Selective, notifications, autoprune, no pre-pulling."
arch=('any')
url="https://github.com/sudo-kraken/podcheck"
license=('GPL-3.0-only')
depends=(bash podman podman-compose jq regclient-regctl)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sudo-kraken/podcheck/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f11e02e5dc82eb66c81402b86ee942c488f5156e1b530f2943061be8b2c74416')

package() {
	cd "$pkgname-$pkgver"
    install -D podcheck.sh $pkgdir/usr/bin/$pkgname
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -D README.md $pkgdir/usr/share/doc/$pkgname/README.md
	install -D notify_templates/notify*.sh -t $pkgdir/usr/share/$pkgname/
}
