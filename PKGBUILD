# Contributor: BrinkerVII <brinkervii@gmail.com>
# Maintainer: tee < teeaur at duck dot com >

_pkgbase=luau
pkgname=luau-bin
pkgver=0.656
pkgrel=1
pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=('x86_64')
url='https://github.com/luau-lang/luau'
license=('MIT')
conflicts=("$_pkgbase" "$_pkgbase"-git)
provides=("$_pkgbase")
source=("luau-$pkgver.zip::https://github.com/luau-lang/luau/releases/download/${pkgver}/luau-ubuntu.zip")
b2sums=('763529cad3e5c99bf119f37970c22b6ce983a829a84567fe0ce5989b501ddf6bac3e6975f9a4f8f9de069e3bb1d212a5028abaf906578d229932db0e2fbae1b3')

prepare() {
    bsdunzip -o "luau-$pkgver.zip"
}

package() {
    install -Dm755 "$srcdir/luau" -t "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/luau-analyze" "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/luau-compile" "$pkgdir/usr/bin"
}
