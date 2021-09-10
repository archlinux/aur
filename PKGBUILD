pkgname=qcomix
pkgver=1.0.0b6
pkgrel=1
pkgdesc="Qt-based comic viewer."
arch=('i686' 'x86_64')
url="https://gitgud.io/qcomix/qcomix.git"
depends=('qt5-base' 'quazip')
makedepends=('cmake' 'qt5-tools' 'qt5-base')
provides=('qcomix')
source=("$pkgname"::"git+https://gitgud.io/qcomix/qcomix.git#tag=1.0b6")
sha512sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
 cd "$srcdir/$pkgname"
 DESTDIR="$pkgdir" make install
 install -Dm644 "icon.png" "${pkgdir}/usr/share/icons/qcomix.png"
 install -Dm644 "qcomix.desktop" "${pkgdir}/usr/share/applications/qcomix.desktop"
}
