# Maintainer: Adam Perkowski <adas1per@protonmail.com>
_pkgname='hyprlauncher'
pkgname='hyprlauncher-bin'
pkgver=0.2.5
pkgrel=1
pkgdesc='GUI for launching applications, written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/hyprutils/$_pkgname"
url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')"
license=('GPL-2.0')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
    "LICENSE-$pkgver::$url_raw/refs/tags/v$pkgver/LICENSE"
    "README-$pkgver.md::$url_raw/refs/tags/v$pkgver/readme.md")
sha256sums=('1d226d6d457083b3474fe001350dc8fdb2b4f622f75c1c2780f730841bb81573' 'SKIP' 'SKIP')
depends=('gtk4' 'gtk4-layer-shell')
conflicts=("$_pkgname")
provides=("$_pkgname")

package() {
    cd "$srcdir"
    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
