# Maintainer: Adam Perkowski <adas1per@protonmail.com>
_pkgname='hyprlauncher'
pkgname='hyprlauncher-bin'
pkgver=0.2.8
pkgrel=1
pkgdesc='GUI for launching applications, written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/hyprutils/$_pkgname"
_url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')"
license=('GPL-2.0')
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname"
    "LICENSE-$pkgver::$_url_raw/refs/tags/v$pkgver/LICENSE"
    "README-$pkgver.md::$_url_raw/refs/tags/v$pkgver/readme.md")
sha256sums=('07598aeccc6a7acb49d6cb0ce1a14e17494cc764c073bcd5d9c4bb2bf0572ba2'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
            'dec16e9dc01a5572c2891b81fb14b1d2c574cdf31e8b957a268dc422decd2567')
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
