# Contributor: BrinkerVII <brinkervii@gmail.com>
# Maintainer: tee < teeaur at duck dot com >

_pkgbase=luau
pkgname=luau-bin
pkgver=0.658
pkgrel=1
pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=('x86_64')
url='https://github.com/luau-lang/luau'
license=('MIT')
conflicts=("$_pkgbase" "$_pkgbase"-git)
provides=("$_pkgbase")
source=("luau-$pkgver.zip::https://github.com/luau-lang/luau/releases/download/${pkgver}/luau-ubuntu.zip")
b2sums=('f578720357fd79986929dd0863d55d238a17972253d6bc454d80bc95551e31bf4a8849aba75f6ef73d3becb8df60a1ab6b36523c0916ee78da92b1da9f3e61e3')

prepare() {
    bsdunzip -o "luau-$pkgver.zip"
}

package() {
    install -Dm755 "$srcdir/luau" -t "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/luau-analyze" "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/luau-compile" "$pkgdir/usr/bin"
}
