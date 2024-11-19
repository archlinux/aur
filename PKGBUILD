# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
pkgname=linutil-bin
_pkgname=linutil
pkgver=2024.09.28
pkgrel=6
pkgdesc="Chris Titus Tech's Linutil is a distro-agnostic toolbox designed to simplify everyday Linux tasks."
arch=('x86_64' 'aarch64')
url="https://github.com/ChrisTitusTech/$_pkgname"
url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')"
license=('MIT')
source_x86_64=("$_pkgname-$pkgver::$url/releases/download/$pkgver/$_pkgname"
    "$_pkgname-$pkgver.1::$url_raw/refs/tags/v$pkgver/man/$_pkgname.1"
    "$_pkgname-$pkgver.desktop::$url_raw/refs/tags/v$pkgver/$_pkgname.desktop"
    "LICENSE-$pkgver::$url_raw/refs/tags/v$pkgver/LICENSE"
    "README-$pkgver.md::$url_raw/refs/tags/v$pkgver/readme.md")
source_aarch64=("$_pkgname-$pkgver::$url/releases/download/$pkgver/$_pkgname-aarch64"
    "$_pkgname-$pkgver.1::$url_raw/refs/tags/v$pkgver/man/$_pkgname.1"
    "$_pkgname-$pkgver.desktop::$url_raw/refs/tags/v$pkgver/$_pkgname.desktop"
    "LICENSE-$pkgver::$url_raw/refs/tags/v$pkgver/LICENSE"
    "README-$pkgver.md::$url_raw/refs/tags/v$pkgver/readme.md")
depends=('git' 'pacman')
optdepends=('ttf-nerd-fonts-symbols: symbols and icons')
conflicts=("$_pkgname")
provides=("$_pkgname")
sha256sums_x86_64=('224fe5f878cf5e5b0d98cbff886340af3519b968187cc641cfcfcd7f904c59b3' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_aarch64=('d1db3fe53c7c2258a1bb181bdd4afa9b96de21365d412c4f90c034104671f97b' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    echo "Version=$pkgver" >> "$_pkgname-$pkgver.desktop"
}

package() {
    cd "$srcdir"

    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname-$pkgver.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
    install -Dm644 "$_pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
