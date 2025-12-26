pkgname=hypr-audio
pkgver=0.1.0
pkgrel=1
pkgdesc="Audio profile switcher for PipeWire/PulseAudio (CLI + GUI)"
arch=('x86_64')
url="https://github.com/ShayanSadeghi/hypr-audio"
license=('MIT')

depends=('pipewire' 'libxkbcommon')
makedepends=('rust' 'cargo')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 target/release/hypr-audio \
        "$pkgdir/usr/bin/hypr-audio"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
