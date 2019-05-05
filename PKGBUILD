# Maintainer: Iwan Timmer <irtimmer at gmail dot com>

pkgname=k4dirstat
pkgver=3.1.4
_commit=0fd87f361645
pkgrel=1
pkgdesc="A graphical disk usage utility for KDE (KDE4 port)"
arch=('i686' 'x86_64')
url='https://bitbucket.org/jeromerobert/k4dirstat'
license=('GPL')
depends=('hicolor-icon-theme' 'kdelibs4support' )
makedepends=('extra-cmake-modules' 'kdoctools' 'karchive')
source=("https://bitbucket.org/jeromerobert/k4dirstat/get/k4dirstat-$pkgver.tar.bz2")
sha256sums=('1b3f54a4e2e2a0b530cb95652a4c2f14f5ce7cb075eeafa738539f7b95baa845')

build() {
  cd "${srcdir}/jeromerobert-k4dirstat-$_commit"
  cmake -DCMAKE_INSTALL_PREFIX=$(kf5-config --prefix)
  make
}

package() {
  cd "${srcdir}/jeromerobert-k4dirstat-$_commit"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/k4dirstat/LICENSE
}
