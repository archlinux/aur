# Submitter: Eric Rodrigues Pires <archlinux@ericpires.com.br>
pkgname='sandhole-bin'
pkgver='0.10.1'
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
sha256sums_x86_64=('ad76cfab73779a7f024fc50ffb1febe2550075dc671a47b1a255249a68e17f50')
sha256sums_aarch64=('d43bc221b4ee92783a27b1729b79bdb12509a6b3a915fce088f56630e38a3544')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm0755 "$srcdir/$pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/sandhole"
    elif [ "$CARCH" = "aarch64" ]; then
        install -Dm0755 "$srcdir/$pkgname-$pkgver-aarch64" "$pkgdir/usr/bin/sandhole"
    fi
    install -Dm0644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
