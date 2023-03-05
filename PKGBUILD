# Maintainer: BrinkerVII <brinkervii@gmail.com>

_pkgbase=luau
pkgname=luau-bin
pkgver=0.566
pkgrel=1

pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=('x86_64')
url='https://github.com/Roblox/luau'
license=('MIT')

makedepends=('unzip')
conflicts=("$_pkgbase" "$_pkgbase"-git)
provides=("$_pkgbase")
source=("luau-$pkgver.zip::https://github.com/Roblox/luau/releases/download/$pkgver/luau-ubuntu.zip")
sha512sums=('02c6bc4f3800ea8d5fc003ae555683801aa4a5addac0660bb5e9654b380e9cf38f55f57c5a6cc8587d6722fb954e33334f9034e5c60690c26c26c781acbe4e87')

prepare() {
    unzip -o "luau-$pkgver.zip"
}

package() {
    install -Dm755 "$srcdir/luau" "$pkgdir/usr/bin/luau"
    install -Dm755 "$srcdir/luau-analyze" "$pkgdir/usr/bin/luau-analyze"
}
