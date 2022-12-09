# Maintainer: BrinkerVII <brinkervii@gmail.com>

_pkgbase=luau
pkgname=luau-bin
pkgver=0.556
pkgrel=1

pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=('x86_64')
url='https://github.com/Roblox/luau'
license=('MIT')

makedepends=('unzip')
conflicts=("$_pkgbase" "$_pkgbase"-git)
provides=("$_pkgbase")
source=("luau-$pkgver.zip::https://github.com/Roblox/luau/releases/download/$pkgver/luau-ubuntu.zip")
sha512sums=('9430f0c58fdcc13c12d859cef355d5e51639b55af0c7554d626c5e0dbc117af2d66dbb488ac9c644e1834e78a6ba18e065e384ce0302111732f6480c247164cb')

prepare() {
    unzip -o "luau-$pkgver.zip"
}

package() {
    install -Dm755 "$srcdir/luau" "$pkgdir/usr/bin/luau"
    install -Dm755 "$srcdir/luau-analyze" "$pkgdir/usr/bin/luau-analyze"
}
