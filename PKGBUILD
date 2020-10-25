# Maintainer: Iwan Timmer <irtimmer at gmail dot com>

pkgname=k4dirstat
pkgver=3.2.1
pkgrel=1
pkgdesc="A graphical disk usage utility for KDE"
arch=('i686' 'x86_64')
url='https://github.com/jeromerobert/k4dirstat'
license=('GPL')
depends=('hicolor-icon-theme' 'kdelibs4support' )
makedepends=('extra-cmake-modules' 'kdoctools' 'karchive')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('eef1308591800514b4127e70943a10cd6f5c4456da58755e3a55359bf311904a')

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
