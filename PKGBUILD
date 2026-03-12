# Maintainer: Martan03 <martinslezak03@gmail.com>
pkgname=gecol
pkgver=0.1.0
pkgrel=1
pkgdesc="A perception-aware accent color extractor and dynamic theme generator."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/Martan03/gecol"
license=('GPL3')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Martan03/gecol/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e767ef79687196957425f8633b0b3bf87f9871eaed3f20be79f2b8005fd39914')

build() {
	cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 target/release/gecol "$pkgdir/usr/bin/gecol"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
