# Maintainer: Dian M Fay <dian.m.fay@gmail.com>

pkgname=mnem
pkgver=0.1.0
pkgrel=1
pkgdesc="An extra-fuzzy shell history searcher"
url="https://gitlab.com/dmfay/mnem"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/dmfay/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('de26093325132235f80d19f4fc43c52b5bf77259c6c3daee2d5399846e2e9fcfd48d837d416d3c0504fe30df4ed7685723da4746569dfef93f8438806be35e9b')

build() {
	cd "$pkgname-v$pkgver"
	cargo build --release --target-dir "./target"
}

package() {
	cd "$pkgname-v$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
