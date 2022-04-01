# Maintainer: schuay <jakob.gruber@gmail.com>
# Previous Maintainer:  TDY <tdy@gmx.com>
# Contributor: Massimiliano Torromeo <Massimiliano.Torromeo AT gmail DOT com>

pkgname=openssh-askpass
pkgver=2.1.0
pkgrel=3
pkgdesc='A plasma-like passphrase dialog for ssh'
arch=('x86_64')
url='http://hugo.pereira.free.fr/software/index.php?page=package&package_list=software_list_qt4&package=openssh-askpass&full=0'
license=('GPL')
depends=('openssh' 'qt5-x11extras' 'qt5-svg' 'xcb-util-keysyms')
makedepends=('cmake')
provides=('x11-ssh-askpass')
source=("http://hugo.pereira.free.fr/software/tgz/$pkgname-$pkgver.tar.gz")
install=$pkgname.install
         
build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DUSE_QT5=ON ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}

md5sums=('707e4533cab44b0ec767bd27d326fd71')
