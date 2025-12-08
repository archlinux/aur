# Maintainer: André Kugland <kugland@gmail.com>

_pkgname=neocities-deploy
pkgname=$_pkgname-bin
pkgdesc='Command-line tool for deploying your Neocities site (prebuilt statically-linked binary)'
url="https://github.com/kugland/$_pkgname"
pkgver=0.1.21
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('GPL-3.0-or-later')
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz") # For README.md
source_x86_64=("$_pkgname-$pkgver-bin-x86_64.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-x86_64-musl.tar.gz")
source_i686=("$_pkgname-$pkgver-bin-i686.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-i686-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-bin-aarch64.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-aarch64-musl.tar.gz")
source_armv7h=("$_pkgname-$pkgver-bin-arm.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-arm-musl.tar.gz")
sha256sums=('00a3bd88d183c481e0e4fc4cb2075995171a25d2950ae7b3df7c19cddef02e9e')
sha256sums_x86_64=('bfd75555010c18b8fff4089562a3c6cb494fcc0640d4d98909729a88041c0b6d')
sha256sums_i686=('4efb4bdaedb5424cd0ef999e6cc16d8ca453f1bd7b2ddfc17df2509080647b96')
sha256sums_aarch64=('d6a088391f0cd4e2e71092c817065691fa7f5a1c162abfca3918831a8dd8c884')
sha256sums_armv7h=('7cbb5695277c1883ff8855ae787bce085a2bd1174fcc6ded222193a2dd2a0abf')

package() {
    cd "$srcdir"
    install -Dm0755 -t "$pkgdir/usr/bin/" neocities-deploy
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm0644 -t "$pkgdir/usr/doc/$_pkgname/" README.md
}
