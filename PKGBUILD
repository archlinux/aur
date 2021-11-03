# Maintainer: BrinkerVII <brinkervii@gmail.com>

_pkgbase=luau
pkgname=luau
pkgver=0.501
pkgrel=1

pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua '
arch=('any')
url='https://github.com/Roblox/luau'
license=('MIT')

makedepends=('unzip')
conflicts=("$_pkgbase"-git)
provides=("$_pkgbase")

source=('https://github.com/Roblox/luau/releases/download/0.501/luau-ubuntu.zip')

sha512sums=('cac11ce57965eab563120fb041497d69d8794ee5c4b812f604d977bfca02fa22573b6414a16291475d0156e2cc0c104d75ea7f265b3e5989510d11a6a8c3cb45')

prepare() {
    unzip -o luau-ubuntu.zip
}

package() {
    install -Dm755 "$srcdir/luau" "$pkgdir/usr/bin/luau"
    install -Dm755 "$srcdir/luau-analyze" "$pkgdir/usr/bin/luau-analyze"
}
