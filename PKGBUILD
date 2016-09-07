# Maintainer: Markus Faerevaag <m@frv.ag>

pkgname=wd-git
pkgver=0.1.0.r1.g7a3f4c4
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Jump to custom directories in terminal"
url="https://github.com/mfaerevaag/wd-c"
license=('MIT')

provides=('wd')
makedepends=('git')
source=("$pkgname"::'git+https://github.com/mfaerevaag/wd-c')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    make prefix="$pkgdir/usr" install
}
