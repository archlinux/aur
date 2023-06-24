# Maintainer: BrinkerVII <brinkervii@gmail.com>

_pkgbase=luau
pkgname=luau-bin
pkgver=0.582
pkgrel=1

pkgdesc='A fast, small, safe, gradually typed embeddable scripting language derived from Lua'
arch=('x86_64')
url='https://github.com/Roblox/luau'
license=('MIT')

makedepends=('unzip')
conflicts=("$_pkgbase" "$_pkgbase"-git)
provides=("$_pkgbase")
source=("luau-$pkgver.zip::https://github.com/Roblox/luau/releases/download/$pkgver/luau-ubuntu.zip")
sha512sums=('cdf0789093aecb173f85a9e68ec820e2319b7cea61ea7861b340dd1c68f4a9053cc4306b77f7e7f894b58f4bf8a165d59679ca30114acb25d276872d478b884e')

prepare() {
    unzip -o "luau-$pkgver.zip"
}

package() {
    install -Dm755 "$srcdir/luau" "$pkgdir/usr/bin/luau"
    install -Dm755 "$srcdir/luau-analyze" "$pkgdir/usr/bin/luau-analyze"
}
