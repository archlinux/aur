pkgname=ods
pkgver=0.0.1
pkgrel=1
pkgdesc="CLI for Open Data Schema"
arch=('x86_64' 'i686')
url="https://github.com/open-data-schema/ods"
license=("MIT")
provides=("ods")
conflicts=("ods-bin")
makedepends=('cargo')
source=($pkgname-$pkgver.zip::https://github.com/open-data-schema/ods/archive/refs/tags/v$pkgver.zip)
sha256sums=("94bf29987af53aaa7ca8f2a4339569878faaa98657447a19e099df0e87895770")

build() {
    cd "$srcdir/ods-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/ods-$pkgver"
    install -Dm755 "target/release/ods" "$pkgdir/usr/bin/ods"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ods/LICENSE"
}
