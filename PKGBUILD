# Maintainer: Iwan Timmer <irtimmer at gmail dot com>

pkgname=k4dirstat
pkgver=3.1.1
_commit=57e7fab6009f
pkgrel=1
pkgdesc="A graphical disk usage utility for KDE (KDE4 port)"
arch=('i686' 'x86_64')
url=('https://bitbucket.org/jeromerobert/k4dirstat')
license=('GPL')
depends=('hicolor-icon-theme' 'kdelibs4support' )
makedepends=('extra-cmake-modules' 'kdoctools' 'karchive')
source=("https://bitbucket.org/jeromerobert/k4dirstat/get/k4dirstat-$pkgver.tar.bz2")
sha256sums=('ce06c6ac543d05e0e7cbdf349f647bf4d3a28bef9b3f0db036a554584afb03df')

build() {
  cd "${srcdir}/jeromerobert-k4dirstat-$_commit"
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "${srcdir}/jeromerobert-k4dirstat-$_commit"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/k4dirstat/LICENSE
}
