# Maintainer: fiatjaf <fiatjaf@gmail.com>

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname-$pkgver"
    ln -s "$pkgname-$pkgver" "$pkgdir/usr/bin/$provides"
    chmod +x "$pkgname-$pkgver"
    export HOME="$srcdir/nak-conf"
    ./"$pkgname-$pkgver" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$provides"
    ./"$pkgname-$pkgver" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$provides"
    ./"$pkgname-$pkgver" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$provides.fish"
    ./"$pkgname-$pkgver" completion pwsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/powershell/Completions/$provides.ps1"
    install -Dm644 "nak.1" "$pkgdir/usr/share/man/man1/$provides.1"
}

pkgname="nak-nodb-bin"
pkgver="0.21.1"
pkgrel="1"
pkgdesc="a command line tool for doing all things Nostr (version without a persistent database on disk)"
arch=("x86_64")
url="https://github.com/fiatjaf/nak"
license=("Unlicense")
depends=()
provides=("nak")
conflicts=("nak" "nak-bin" "nak-b-bin")
source=("$pkgname-$pkgver::https://github.com/fiatjaf/nak/releases/download/v$pkgver/nak-nodb-v$pkgver-linux-amd64" "nak.1::https://github.com/fiatjaf/nak/releases/download/v$pkgver/nak.1")

sha256sums=('2ecf1c12a6443dc56a1934693da66cbe0ce74f34bcb999c74acaf492bd6dc2bc' 'SKIP')
