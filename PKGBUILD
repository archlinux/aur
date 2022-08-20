# Maintainer: Iwan Timmer <irtimmer at gmail dot com>

pkgname=k4dirstat
pkgver=3.4.2
pkgrel=1
pkgdesc="A graphical disk usage utility for KDE"
arch=('i686' 'x86_64')
url='https://github.com/jeromerobert/k4dirstat'
license=('GPL')
depends=('hicolor-icon-theme' 'kdelibs4support' )
makedepends=('extra-cmake-modules' 'kdoctools' 'karchive')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('c925aa058928ca755984ec708955be936ee5c38d594ba0a21000469539e00424')

build() {
  cd "${srcdir}/k4dirstat-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=$(kf5-config --prefix)
  make
}

package() {
  cd "${srcdir}/k4dirstat-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/k4dirstat/LICENSE
}
