# Contributor: BrinkerVII <brinkervii@gmail.com>
# Maintainer: tee < teeaur at duck dot com >

_pkgbase=luau
pkgname=luau-bin
pkgver=0.661
pkgrel=1
pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=('x86_64')
url='https://github.com/luau-lang/luau'
license=('MIT')
conflicts=("$_pkgbase" "$_pkgbase"-git)
provides=("$_pkgbase")
source=("luau-$pkgver.zip::https://github.com/luau-lang/luau/releases/download/${pkgver}/luau-ubuntu.zip")
b2sums=('a281a53823964dde4a40219c78918a0edb19a9e9d01111af8af2b3fa2e3bdeea7a7a1eec47166788f2683ec2475a6f7f1da3e6187907848eca8fb0fda95fd8ea')

prepare() {
    bsdunzip -o "luau-$pkgver.zip"
}

package() {
    install -Dm755 "$srcdir/luau" -t "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/luau-analyze" "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/luau-compile" "$pkgdir/usr/bin"
}
