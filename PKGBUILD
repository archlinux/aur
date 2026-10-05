# Maintainer: fiatjaf <fiatjaf@gmail.com>

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname-$pkgver"
    ln -s "$pkgname-$pkgver" "$pkgdir/usr/bin/$provides"
    chmod +x "$pkgname-$pkgver"
    ./"$pkgname-$pkgver" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$provides"
    ./"$pkgname-$pkgver" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$provides"
    ./"$pkgname-$pkgver" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$provides.fish"
    ./"$pkgname-$pkgver" completion pwsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/powershell/Completions/$provides.ps1"
}

pkgname="nak-bin"
pkgver="0.21.0"
pkgrel="1"
pkgdesc="a command line tool for doing all things Nostr"
arch=("x86_64")
url="https://github.com/fiatjaf/nak"
license=("Unlicense")
depends=()
provides=("nak")
conflicts=("nak")
source=("$pkgname-$pkgver::https://github.com/fiatjaf/nak/releases/download/v$pkgver/nak-v$pkgver-linux-amd64")

sha256sums=('7bf6d8d82a9e9cf9aca74a04449fb2235bc49624a73b3539cf7d6f95304837a1')
