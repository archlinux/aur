# Maintainer: Benjamin Bolton <bennybolton@gmail.com>

pkgname=bstatus-git
pkgver=0.2.0.r0.gdbc872a
pkgrel=1
pkgdesc='A simple status line generator'
arch=('any')
url=https://github.com/BennyBolton/bstatus
license=('MIT')
depends=('nodejs')
makedepends=('nodejs' 'npm')
source=('git+https://github.com/BennyBolton/bstatus')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/bstatus"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/bstatus"
    npm install && npm run build
}

package() {
    cd "$srcdir/bstatus"
    mkdir -p "$pkgdir/usr/bin"
    cp bstatus.js "$pkgdir/usr/bin/bstatus"
}