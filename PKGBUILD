# Maintainer: Adam Perkowski <adas1per@protonmail.com>
_pkgname='hyprlauncher'
pkgname='hyprlauncher-bin'
pkgver=0.2.6
pkgrel=1
pkgdesc='GUI for launching applications, written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/hyprutils/$_pkgname"
url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')"
license=('GPL-2.0')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
    "LICENSE-$pkgver::$url_raw/refs/tags/v$pkgver/LICENSE"
    "README-$pkgver.md::$url_raw/refs/tags/v$pkgver/readme.md")
sha256sums=('0e9194a18d123b91f90d34f4616abf5e3ca0f1fa00b1bf81618a6d772b7ee046'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
            'fd29a74f88cf2fa2a67394f0487584dbd0770ec597519e03016e3524f0a8e6f0')
depends=('gtk4' 'gtk4-layer-shell')
conflicts=("$_pkgname")
provides=("$_pkgname")
install="$_pkgname.install"

package() {
    cd "$srcdir"
    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
