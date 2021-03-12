# Maintainer: Ben Aaron Goldberg <ben@benaaron.dev>

pkgname=poki-launcher-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="An application launcher that shows recently used apps first"
arch=('x86_64')
url="https://sr.ht/~zethra/poki-launcher/"
license=('GPL3')
provides=('poki-launcher')
conflicts=('poki-launcher')
source=("poki-launcher-src-$pkgver.tar.gz::https://git.sr.ht/~zethra/poki-launcher/archive/$pkgver.tar.gz"
"poki-launcher-bin-$pkgver.gz::https://git.sr.ht/~zethra/poki-launcher/refs/download/$pkgver/poki-launcher-$pkgver-x86_64-unknown-linux-gnu.gz")
depends=('qt5-declarative')
makedepends=('rust' 'cargo')
sha256sums=("5697de9abbf58634586c35baf212b1a71f7a3f8b63263ffa388aca91a2a90e9e"
"c589c724f9d85da375b1e2e3cb526b2b62b59d20f2c70088ef7c5b4c6842e5c0")

realname=poki-launcher

package() {
    install -Dm755 "poki-launcher-bin-$pkgver" "$pkgdir/usr/bin/poki-launcher"
	cd "$realname-$pkgver"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$realname/README.md"
	install -Dm644 "poki-launcher.hjson" "$pkgdir/usr/share/doc/$realname/examples/poki-launcher.hjson"
}
