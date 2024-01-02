# Maintainer: Alireza S.N. <alireza6677 at gmail dot com>

pkgname=evenmoreutils
pkgver=0.6.0
pkgrel=1
pkgdesc="A collection of command line tools to extend the shell environment."
arch=("x86_64")
url="https://github.com/rudymatela/evenmoreutils/"
license=("GPL2")
depends=()
makedepends=("tar" "gcc" "make")
provides=("evenmoreutils")
conflicts=("evenmoreutils")
source=("https://github.com/rudymatela/evenmoreutils/releases/download/v${pkgver}/evenmoreutils-${pkgver}.tar.gz")
b2sums=('7edfc06aa1c4a6d8ad893a238bf91a585f851a5251bb9174aa233a09665a66c2284576a17cd4ee0ac2ee21e3864ae6d714aaf552089da2a1342418dc3c0d1097')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install PREFIX="$pkgdir/usr"
}

