# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=fresco
pkgver=2.9
pkgrel=1
pkgdesc="Coupled reaction channels calculations"
arch=(i686 x86_64)
url=http://fresco.org.uk
license=(GPL3)
makedepends=(gcc-fortran)
source=(http://fresco.org.uk/source/fres-v29.tar.gz)
sha256sums=('3737a107a4e71476733b019c152320585c3bca742db339cb3d08de4f69647766')

build() {
    cd "$srcdir/fres/source"
    make FC=gfortran FFLAGS="-O2 -Wall"
}

package() {
    cd "$srcdir/fres/source"
    install -Dm755 fresco  "$pkgdir/usr/bin/fresco"
    install -Dm755 sfresco "$pkgdir/usr/bin/sfresco"
}
