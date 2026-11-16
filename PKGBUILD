# Submitter: Eric Rodrigues Pires <archlinux@ericpires.com.br>
pkgname='sandhole-bin'
pkgver='0.10.6'
pkgrel=1
pkgdesc='Expose HTTP/SSH/TCP services through SSH port forwarding (binary release)'
arch=('x86_64' 'aarch64')
url='https://sandhole.com.br'
license=('MIT')
depends=()
provides=('sandhole')
conflicts=('sandhole')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/EpicEric/sandhole/refs/tags/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/EpicEric/sandhole/releases/download/v$pkgver/sandhole-linux-amd64")
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/EpicEric/sandhole/releases/download/v$pkgver/sandhole-linux-arm64")
sha256sums=('SKIP')
sha256sums_x86_64=('8e2a2b69bc99673a6c81f5a17f5e357f031fcc4f8404852c1df7977e677636af')
sha256sums_aarch64=('93de50953e4e0671530bb10258a9d76a69a57c9ee632246a4f73dbcdef52b58d')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm0755 "$srcdir/$pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/sandhole"
    elif [ "$CARCH" = "aarch64" ]; then
        install -Dm0755 "$srcdir/$pkgname-$pkgver-aarch64" "$pkgdir/usr/bin/sandhole"
    fi
    install -Dm0644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
