# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=apriltag
pkgver=3.1.1
pkgrel=1
pkgdesc="AprilTag is a visual fiducial system popular for robotics research."
arch=('x86_64')
url="https://april.eecs.umich.edu/software/apriltag"
license=('BSD')
source=("https://github.com/AprilRobotics/apriltag/archive/${pkgver}.tar.gz")
md5sums=('818e0087c8b752b3699b6fb0686ae134')
sha256sum=('7349e1fcc8b2979230b46c0d62ccf2ba2bbd611d87ef80cfd37ffe74425f5efb')

prepare() {
  mkdir -p "$srcdir/build"
}


build() {
  cd "$srcdir/build"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "$srcdir/${pkgname}-${pkgver}"
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
