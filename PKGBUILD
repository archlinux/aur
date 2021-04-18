# Maintainer: Ben Aaron Goldberg <ben@benaaron.dev>

pkgname=poki-launcher-bin
pkgver=0.7.0
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
sha256sums=("e0578de1a3916efdd962f24bc8c8fa3a26916e97e56627ffeeb84493f8b206e6"
"8262f6e67aaac98e549afc36bacfe64aa87453933a9971974ff7167d2fb03c9e")

realname=poki-launcher

package() {
	install -Dm755 "poki-launcher-bin-$pkgver" "$pkgdir/usr/bin/poki-launcher"
	cd "$realname-$pkgver"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$realname/README.md"
	install -Dm644 "poki-launcher.hjson" "$pkgdir/usr/share/doc/$realname/examples/poki-launcher.hjson"
}
