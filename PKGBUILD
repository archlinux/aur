# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=codesnap
pkgname="$_pkgname-bin"
pkgver=0.8.3
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
            '557abbe846c3883101e335f8789ed79665b5601c2124db1059b5faf440fbcef6')
sha256sums_x86_64=('f3ca16a96616e42b718008299ef2ecb8bf5398ee8701d91dafae12a78a406355')
sha256sums_aarch64=('12fb871c3fee48dd45727f291324ef99573111bb79faef457fcecb3bfaed2bfa')
depends=('glibc' 'oniguruma')
provides=("$_pkgname")
conflicts=("$_pkgname")

package() {
    cd "$srcdir"

    install -Dm0755 "$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
