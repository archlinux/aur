# Maintainer: Wojciech Kepka <wojciech@wkepka.dev>
pkgname=pkger-rs
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc='Build rpm, deb, pkg and other packages using Docker'
arch=('x86_64')
url='https://github.com/wojciechkepka/pkger'
license=('MIT')
depends=()
makedepends=('cargo')
provides=("pkger")
conflicts=("pkger")
sha1sums=('SKIP')
source=("${url}/archive/refs/tags/${pkgver}-${pkgrel}.tar.gz")

build() {
    cd $pkgname
    cargo build --release
}

package() {
	cd $pkgname
	install -Dm755 "target/release/pkger" "$pkgdir/usr/bin/pkger"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
