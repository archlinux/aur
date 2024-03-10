# Maintainer: André Kugland <kugland@gmail.com>

_pkgname=neocities-deploy
pkgname=$_pkgname-bin
pkgdesc='Command-line tool for deploying your Neocities site (prebuilt statically linked binary)'
url="https://github.com/kugland/$_pkgname"
pkgver=0.1.11
pkgrel=2
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
makedepends=(curl)
license=('GPL-3.0-or-later')
options=(!lto)
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz") # For README.md
sha256sums=('0a8fee770fba94a75e34936056adead6b15b50c28f178d0aee7143e0bf55ff67')
sha256sums_x86_64=('170d976c7d40eb26c7cfab88b19dc1e8adaf20ae7a6155e1cd24cb2facb4e51f')
sha256sums_i686=('87db33c2800a373780638943ac3597cb7e2f7f365444382cba3c2575dd049d6b')
sha256sums_aarch64=('2012984e16e93f7d09501edbd3e342272071dbcb1815ad9ff2f8157370223df7')
sha256sums_armv7h=('3c89ddc1d86554baac705a5a5151942fb75d98349519443fede0a6ba05b7394f')
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
