# Maintainer: Adam Perkowski <adas1per@protonmail.com>
_pkgname='hyprlauncher'
pkgname='hyprlauncher-bin'
pkgver=0.2.2
pkgrel=2
pkgdesc='GUI for launching applications, written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/hyprutils/$_pkgname"
url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')"
license=('GPL-2.0')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
    "LICENSE-$pkgver::$url_raw/refs/tags/v$pkgver/LICENSE"
    "README-$pkgver::$url_raw/refs/tags/v$pkgver/readme.md")
sha256sums=('da70ccf91f32c8aa0b87211d1d70e5a2a74b1deab3b80011e38ff23754513d52' 'SKIP' 'SKIP')
depends=('gtk4' 'gtk4-layer-shell')
conflicts=("$_pkgname")
provides=("$_pkgname")

package() {
    cd "$srcdir"
    install -Dm0755 "$_pkgname-$pkgver" -t "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "LICENSE-$pkgver" -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 "README-$pkgver" -t "$pkgdir/usr/share/doc/$_pkgname"
}
