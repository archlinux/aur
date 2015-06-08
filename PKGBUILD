pkgname=qamqp-git
pkgver=r253.5c7eca5
pkgver() {
  cd "$srcdir/qamqp"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Qt4/Qt5 implementation of AMQP 0.9.1"
arch=('i686' 'x86_64')
url="https://github.com/mbroadst/qamqp"
license=('MIT')
depends=('qt5-base')
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
