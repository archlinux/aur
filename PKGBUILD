# Submitter: Eric Rodrigues Pires <archlinux@ericpires.com.br>
pkgname='sandhole-bin'
pkgver='0.10.0'
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
sha256sums_x86_64=('3fd7edf43d930af501e3615462fd434386980f1926c992577c4e25f185331976')
sha256sums_aarch64=('10749d13eab101432a0915cffa15176df9a87b8ed89aac4f1915e5bafb9276e4')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm0755 "$srcdir/$pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/sandhole"
    elif [ "$CARCH" = "aarch64" ]; then
        install -Dm0755 "$srcdir/$pkgname-$pkgver-aarch64" "$pkgdir/usr/bin/sandhole"
    fi
    install -Dm0644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
