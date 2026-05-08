# Maintainer: André Kugland <kugland@gmail.com>

_pkgname=neocities-deploy
pkgname=$_pkgname-bin
pkgdesc='Command-line tool for deploying your Neocities site (prebuilt statically-linked binary)'
url="https://github.com/kugland/$_pkgname"
pkgver=0.1.24
pkgrel=1
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('GPL-3.0-or-later')
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz") # For README.md
source_x86_64=("$_pkgname-$pkgver-bin-x86_64.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-x86_64-musl.tar.gz")
source_i686=("$_pkgname-$pkgver-bin-i686.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-i686-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-bin-aarch64.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-aarch64-musl.tar.gz")
source_armv7h=("$_pkgname-$pkgver-bin-arm.tar.gz::${url}/releases/download/v$pkgver/$_pkgname-Linux-arm-musl.tar.gz")
sha256sums=('e8327798b8de683fca72cbea2e6a26d3fcf776789466f6ca51f36372c60033ae')
sha256sums_x86_64=('1817843c3ea67b2e9f2d7f773967382e4d45cd04b6c3380358b9c671583ce987')
sha256sums_i686=('4e614fd4193bd8bca9840d050ab9904acf6017a9c1e7aa5b8202e0bd68db0297')
sha256sums_aarch64=('93a424df7ad0f670df375885724716349b464b40034265585077ecd630435a46')
sha256sums_armv7h=('11ecc35024d3e1f4ca64bf40621f2b1b3b2439e139df7de8c07104766c413ac1')

package() {
    cd "$srcdir"
    install -Dm0755 -t "$pkgdir/usr/bin/" neocities-deploy
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm0644 -t "$pkgdir/usr/doc/$_pkgname/" README.md
}
