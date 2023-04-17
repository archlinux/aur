# Maintainer: Alad Wenter <https://github.com/AladW>
pkgname=aurum
pkgver=0.2
pkgrel=1
pkgdesc='high-level wrapper for aurutils with extra features'
url='https://github.com/AladW/aurum'
arch=('any')
license=('custom:ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
changelog=aurum.changelog
depends=('aurutils' 'bat' 'git-delta' 'ninja')
sha256sums=('6c7a53a321b078a17cd836295cc12c8396600703f91c57b1826dfe45eed3c9c2')

build() {
    cd "$pkgname-$pkgver"
    make AURUM_VERSION="$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
