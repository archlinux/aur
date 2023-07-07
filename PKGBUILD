# Maintainer: BrinkerVII <brinkervii@gmail.com>

_pkgbase=luau
pkgname=luau-bin
pkgver=0.583
pkgrel=1

pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=('x86_64')
url='https://github.com/Roblox/luau'
license=('MIT')

makedepends=('unzip')
conflicts=("$_pkgbase" "$_pkgbase"-git)
provides=("$_pkgbase")
source=("luau-$pkgver.zip::https://github.com/Roblox/luau/releases/download/$pkgver/luau-ubuntu.zip")
sha512sums=('a53725283b1c4fd73f745d7640035016a3b4d5bc9fe804f47e2e8d6f55da4f85e10bdf557bc6ce13a902473b9cdec65e5310b46306e85fc6c1afad89e6135211')

prepare() {
    unzip -o "luau-$pkgver.zip"
}

package() {
    install -Dm755 "$srcdir/luau" "$pkgdir/usr/bin/luau"
    install -Dm755 "$srcdir/luau-analyze" "$pkgdir/usr/bin/luau-analyze"
}
