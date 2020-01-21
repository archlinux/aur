# Maintainer: Marko Korhonen <marko.korhonen@reekynet.com>
pkgname="lqsd"
pkgdesc="LiQuid Screen Dim - Dim your screen smoothly"
pkgver=0.1.1
pkgrel=1
arch=('x86_64')
url="https://github.com/ReekyMarko/lqsd"
license=('MIT')
depends=('light')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ReekyMarko/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('60274d9157f9adba7486255baf38bb5afa538026ca1426a3d739d022a93a981e')

build(){
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname/-bin/}"
}
