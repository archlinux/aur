# Contributor: BrinkerVII <brinkervii@gmail.com>
# Maintainer: tee < teeaur at duck dot com >

_pkgbase=luau
pkgname=luau-bin
pkgver=0.626
pkgrel=1
pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=('x86_64')
url='https://github.com/luau-lang/luau'
license=('MIT')
conflicts=("$_pkgbase" "$_pkgbase"-git)
provides=("$_pkgbase")
source=("luau-$pkgver.zip::https://github.com/luau-lang/luau/releases/download/${pkgver}/luau-ubuntu.zip")
b2sums=('d12634c6c1557983200d2be5878be22f3ace5d2de8472e185018377ba3a0b2e2f209eb6322a4883f29090f5330711f50779c16d410b1729736d2394c78f206bd')

prepare() {
    bsdunzip -o "luau-$pkgver.zip"
}

package() {
    install -Dm755 "$srcdir/luau" -t "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/luau-analyze" "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/luau-compile" "$pkgdir/usr/bin"
}
