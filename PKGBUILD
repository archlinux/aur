# Contributor: BrinkerVII <brinkervii@gmail.com>
# Maintainer: tee < teeaur at duck dot com >

_pkgbase=luau
pkgname=luau-bin
pkgver=0.646
pkgrel=1
pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=('x86_64')
url='https://github.com/luau-lang/luau'
license=('MIT')
conflicts=("$_pkgbase" "$_pkgbase"-git)
provides=("$_pkgbase")
source=("luau-$pkgver.zip::https://github.com/luau-lang/luau/releases/download/${pkgver}/luau-ubuntu.zip")
b2sums=('3013e316c22907d8edf9f444525a84b7034add95995b8e0b1260d4ac7e7542349a1fbd6598ec97fe389eb413e7b4d556b9fefc0609952261071a7feef260d369')

prepare() {
    bsdunzip -o "luau-$pkgver.zip"
}

package() {
    install -Dm755 "$srcdir/luau" -t "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/luau-analyze" "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/luau-compile" "$pkgdir/usr/bin"
}
