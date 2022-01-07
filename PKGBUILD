# Maintainer: BrinkerVII <brinkervii@gmail.com>

_pkgbase=luau
pkgname=luau-bin
pkgver=0.509
pkgrel=1

pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=('x86_64')
url='https://github.com/Roblox/luau'
license=('MIT')

makedepends=('unzip')
conflicts=("$_pkgbase" "$_pkgbase"-git)
provides=("$_pkgbase")

source=("luau-$pkgver.zip::https://github.com/Roblox/luau/releases/download/$pkgver/luau-ubuntu.zip")

sha512sums=('0c0ffa30b9325ae1c368e1ed67c4f9a5abf0f30cb7e2d8ba198d2206423eb0d017e50759e76a5b19c9d139a4bc87e7fb2554112038f8a48843246491aa999926')

prepare() {
    unzip -o "luau-$pkgver.zip"
}

package() {
    install -Dm755 "$srcdir/luau" "$pkgdir/usr/bin/luau"
    install -Dm755 "$srcdir/luau-analyze" "$pkgdir/usr/bin/luau-analyze"
}
