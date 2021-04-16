pkgname=qamqp-git
pkgver=v0.5.0.r29.gb5c660a
pkgver() {
  cd "$srcdir/qamqp"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="Qt4/Qt5 implementation of AMQP 0.9.1"
arch=('i686' 'x86_64')
url="https://github.com/mbroadst/qamqp"
license=('GPL2')
depends=('qt5-base')
makedepends=('git')
source=("git+https://github.com/mbroadst/qamqp.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/qamqp"
    qmake PREFIX="$pkgdir/usr"
    make
}

package() {
    cd "$srcdir/qamqp"
    make install
}
