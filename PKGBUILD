# Maintainer: fiatjaf <fiatjaf@gmail.com>

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname-$pkgver"
    ln -s "$pkgname-$pkgver" "$pkgdir/usr/bin/$provides"
    chmod +x "$pkgname-$pkgver"
    ./"$pkgname-$pkgver" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$provides"
    ./"$pkgname-$pkgver" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$provides"
    ./"$pkgname-$pkgver" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$provides.fish"
    ./"$pkgname-$pkgver" completion pwsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/powershell/Completions/$provides.ps1"
    install -Dm644 "nak.1" "$pkgdir/usr/share/man/man1/$provides.1"
}

pkgname="nak-bin"
pkgver="0.22.0"
pkgrel="1"
pkgdesc="a command line tool for doing all things Nostr"
arch=("x86_64")
url="https://github.com/fiatjaf/nak"
license=("Unlicense")
depends=()
provides=("nak")
conflicts=("nak")
source=("$pkgname-$pkgver::https://github.com/fiatjaf/nak/releases/download/v$pkgver/nak-v$pkgver-linux-amd64" "nak.1::https://github.com/fiatjaf/nak/releases/download/v$pkgver/nak.1")
sha256sums=('f4cb05c42e2cab2d85f436c42aece1f6e10499e1166b6e0ad1fd3e3973b70712'
            '59c7c04cc84a343c72bfc83d17f6ea4a4a2216bd71c9ef11c6997baeb70b9ca3')
