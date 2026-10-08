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
pkgver="0.21.2"
pkgrel="1"
pkgdesc="a command line tool for doing all things Nostr (version without a persistent database on disk)"
arch=("x86_64")
url="https://github.com/fiatjaf/nak"
license=("Unlicense")
depends=()
provides=("nak")
conflicts=("nak" "nak-bin" "nak-b-bin")
source=("$pkgname-$pkgver::https://github.com/fiatjaf/nak/releases/download/v$pkgver/nak-nodb-v$pkgver-linux-amd64" "nak.1::https://github.com/fiatjaf/nak/releases/download/v$pkgver/nak.1")
sha256sums=('e2fbbdf24cda6fae99c777f11003e0b517b43ac1a40224c78fa87a051354e394'
            '59c7c04cc84a343c72bfc83d17f6ea4a4a2216bd71c9ef11c6997baeb70b9ca3')
