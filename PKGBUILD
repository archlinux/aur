# Maintainer: BrinkerVII <brinkervii@gmail.com>
# Maintainer: tee < teeaur at duck dot com >

_pkgbase=luau
pkgname=luau-bin
pkgver=0.609
pkgrel=1

pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=('x86_64')
url='https://github.com/luau-lang/luau'
license=('MIT')

makedepends=('unzip')
conflicts=("$_pkgbase" "$_pkgbase"-git)
provides=("$_pkgbase")
source=("luau-$pkgver.zip::https://github.com/luau-lang/luau/releases/download/${pkgver}/luau-ubuntu.zip")
b2sums=('be0d6e19b3ee9ec69498d7ec02a3f1cdc98785e2219b5ac827b984ccb5ea631043bbdb65f86fb2178ca7ecbda4b44a09160605f1843dbaa6a2ea382b2618bd16')

prepare() {
    unzip -o "luau-$pkgver.zip"
}

package() {
    install -Dm755 "$srcdir/luau" "$pkgdir/usr/bin/luau"
    install -Dm755 "$srcdir/luau-analyze" "$pkgdir/usr/bin/luau-analyze"
}
