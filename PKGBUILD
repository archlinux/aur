# Maintainer: Benjamin Bolton <bennybolton@gmail.com>

pkgname=dvdcat-git
pkgver=0.1.0.r0.g20cf1c0
pkgrel=1
pkgdesc='Write dvd contents to stdout'
arch=('any')
url=https://github.com/BennyBolton/dvdcat
license=('GPL3')
depends=('libdvdread')
optdepends=('libdvdcss: decrypting dvds')
makedepends=('libdvdread')
source=('git+https://github.com/BennyBolton/dvdcat')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/dvdcat"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/dvdcat"
    make
}

package() {
    cd "$srcdir/dvdcat"
    make DESTDIR="$pkgdir" install
}