# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=codesnap
pkgname="$_pkgname-bin"
pkgver=0.8.2
pkgrel=1
pkgdesc="Pure Rust tool for generating beautiful code snapshots"
arch=('x86_64' 'aarch64')
url="https://github.com/mistricky/$_pkgname"
_url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')"
license=('MIT')
source=("LICENSE-$pkgver::$_url_raw/refs/tags/v$pkgver/LICENSE"
    "README-$pkgver.md::$_url_raw/refs/tags/v$pkgver/README.md")
source_x86_64=("$_pkgname-$pkgver-$CARCH.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$CARCH-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('c9bf5e8137b0570bbb5e737b2a6a7f5eee373007891fe4a4f88d03f0b46fbacd'
            '7513cfc45e41a1655f6aceb3bd1c46d181e2e6566aa8ffe286602db31d7c4010')
sha256sums_x86_64=('aca3eb101fd053a6c98b55c3fddc528d62b6f0b2b586a247f14887acb9903ed7')
sha256sums_aarch64=('2f231f9bdab0827dcfd7669759f8ed6dfa18e5589b081ae23911f99cc26deb61')
depends=('glibc' 'oniguruma')
provides=("$_pkgname")
conflicts=("$_pkgname")

package() {
    cd "$srcdir"

    install -Dm0755 "$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
