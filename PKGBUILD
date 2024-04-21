# Maintainer: André Kugland <kugland@gmail.com>

_pkgname=neocities-deploy
pkgname=$_pkgname-bin
pkgdesc='Command-line tool for deploying your Neocities site (prebuilt statically-linked binary)'
url="https://github.com/kugland/$_pkgname"
pkgver=0.1.12
pkgrel=4
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('GPL-3.0-or-later')
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz") # For README.md
sha256sums=('2d87ab529063db0764c4dfecfedf5618a9bad4608e23e62e032a241e6fc9cb4a')
sha256sums_x86_64=('aaa4b3b4ac955c4ad794a234c134fe89400e4d9e9fe28c620103bc7358444487')
sha256sums_i686=('b17d8ea4150d36892881b7659a98be99a964dadfbc555954261f57c8761192f3')
sha256sums_aarch64=('77879066b38ee2241545fc98f5482496d0f20a36854749a492b35d38d4b9d3f8')
sha256sums_armv7h=('502e1ccb537c238262119de0207682f1a71f97532e1d8ea35c9f8aec9fd573d5')
source_x86_64=("$_pkgname-$pkgver-bin-x86_64.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-x86_64-musl.tar.gz")
source_i686=("$_pkgname-$pkgver-bin-i686.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-i686-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-bin-aarch64.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-aarch64-musl.tar.gz")
source_armv7h=("$_pkgname-$pkgver-bin-arm.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-arm-musl.tar.gz")

package() {
    cd "$srcdir"
    install -Dm0755 -t "$pkgdir/usr/bin/" neocities-deploy
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm0644 -t "$pkgdir/usr/doc/$_pkgname/" README.md
}
