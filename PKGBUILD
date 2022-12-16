# Maintainer: Daniel R. Güell <daniel@drguell.es>
pkgname=masskulator
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple application to plot a chart with weight evolution."
arch=(x86_64)
url="https://gitlab.com/drguell/masskulator"
license=(GPL3)
depends=(qt5-charts)
makedepends=(git qt5-tools cmake extra-cmake-modules kinit kcmutils kdoctools)
source=("git+https://gitlab.com/drguell/$pkgname.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    cmake .
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="${pkgdir}/" install
}
