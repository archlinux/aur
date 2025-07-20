# Maintainer: Rogério Girão <rogeriogirao1@proton.me>
pkgname=fff-dev
pkgver=0.0.8
pkgrel=1
pkgdesc="Simple file finder for linux"
arch=('x86_64')
url="https://github.com/rgcastrof/fff"
license=('GPL3')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("fff-$pkgver.tar.gz::https://github.com/rgcastrof/fff/archive/v$pkgver.tar.gz")
sha256sums=(12a07627340746d439496bb9424d6414a912151c71bd70f4472a477405c708e7)

build() {
        cd "$srcdir/fff-$pkgver"
        make all
}

package() {
        cd "$srcdir/fff-$pkgver"
        make BIN_DIR="$pkgdir/usr/bin" install
}
