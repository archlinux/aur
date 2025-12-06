# Maintainer: André Kugland <kugland@gmail.com>

_pkgname=neocities-deploy
pkgname=$_pkgname-bin
pkgdesc='Command-line tool for deploying your Neocities site (prebuilt statically-linked binary)'
url="https://github.com/kugland/$_pkgname"
pkgver=0.1.18
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('GPL-3.0-or-later')
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz") # For README.md
source_x86_64=("$_pkgname-$pkgver-bin-x86_64.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-x86_64-musl.tar.gz")
source_i686=("$_pkgname-$pkgver-bin-i686.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-i686-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-bin-aarch64.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-aarch64-musl.tar.gz")
source_armv7h=("$_pkgname-$pkgver-bin-arm.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-arm-musl.tar.gz")
sha256sums=('3b77711799f28dd7e6ed2577e143c783ce0e58541ab21dfd174eb32027bd13fa')
sha256sums_x86_64=('c8dbe5432dac58bdf97bd29bf13253bffe15749d2f68cbf4b73308418a97bb72')
sha256sums_i686=('552f1a5080d2bde1abf5ca4927ec4cbe705f49a42edc8af0a1ae8aba72badbe1')
sha256sums_aarch64=('4c50c4920d0849c75e65d87b0098c2d734219eee8dd673426855e87594d9e558')
sha256sums_armv7h=('846666b6d5827f0b5bd0c6920ed2d197c6b85623381483e11f3ff145e1467385')

package() {
    cd "$srcdir"
    install -Dm0755 -t "$pkgdir/usr/bin/" neocities-deploy
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm0644 -t "$pkgdir/usr/doc/$_pkgname/" README.md
}
