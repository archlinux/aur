# Maintainer: Alad Wenter <https://github.com/AladW>
pkgname=aurum
pkgver=0.1
pkgrel=1
pkgdesc='high-level wrapper for aurutils with extra features'
url='https://github.com/AladW/aurum'
arch=('any')
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
changelog=aurum.changelog
depends=('aurutils' 'bat' 'git-delta' 'ninja')
sha256sums=('7f9d02b1898d86ff23cc27c4d658fa314caa6896da59767cdd9fb4a6cde80e64')

build() {
    cd "$pkgname-$pkgver"
    make AURUM_VERSION="$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
