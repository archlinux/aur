# Submitter: Eric Rodrigues Pires <archlinux@ericpires.com.br>
pkgname='sandhole-bin'
pkgver='0.9.3'
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
sha256sums_x86_64=('dbf1a835aa87909cc1e42adb6cd81ea92cffab0ffcf46cfe79c5d7b5b79fa90d')
sha256sums_aarch64=('3da018b219a17b7aa5cdafe5396494b2acfc7d97cf817a23d1e941e2608f7a12')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm0755 "$srcdir/$pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/sandhole"
    elif [ "$CARCH" = "aarch64" ]; then
        install -Dm0755 "$srcdir/$pkgname-$pkgver-aarch64" "$pkgdir/usr/bin/sandhole"
    fi
    install -Dm0644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
