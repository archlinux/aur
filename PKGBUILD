# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=codesnap
pkgname="$_pkgname-bin"
pkgver=0.10.8
pkgrel=1
pkgdesc="Pure Rust tool for generating beautiful code snapshots"
arch=('x86_64' 'aarch64')
url="https://github.com/mistricky/$_pkgname"
_url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')"
license=('MIT')
source=("LICENSE-$pkgver::$_url_raw/refs/tags/v$pkgver/LICENSE"
    "README-$pkgver.md::$_url_raw/refs/tags/v$pkgver/README.md")
source_x86_64=("$_pkgname-$pkgver-$CARCH.tar.gz::$url/releases/download/v$pkgver/$_pkgname-cli_v${pkgver}_$CARCH-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-cli_v${pkgver}_aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('c9bf5e8137b0570bbb5e737b2a6a7f5eee373007891fe4a4f88d03f0b46fbacd'
            'c4940fc04d71ff278ef56b24b05a9b7312785ccbd41fd8dd5285bfb66ec86bb6')
sha256sums_x86_64=('492d28683efb18748206458e8766634488e86ff0cd918324c58ec1db6b4e1adc')
sha256sums_aarch64=('41d7a61ad00f77fb7f7551f8d02374676ede396fcd1042ba1c24efb4fd68e07f')
depends=('gcc-libs' 'glibc' 'oniguruma')
provides=("$_pkgname")
conflicts=("$_pkgname")

package() {
    cd "$srcdir"

    install -Dm0755 "$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
