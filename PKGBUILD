# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=tufao0-qt5
pkgver=0.8.2
pkgrel=1
pkgdesc="An asynchronous web framework for C++ built on top of Qt"
arch=('i686' 'x86_64')
url="https://github.com/vinipsmaker/tufao"
license=('LGPL2')
depends=('qt5-base')
makedepends=('cmake')
source=("https://github.com/vinipsmaker/tufao/archive/${pkgver}.tar.gz")
md5sums=('24f6d66a987c797fab9506ef8f480475')

build() {
  mkdir "${srcdir}/tufao-${pkgver}/build"
  cd "${srcdir}/tufao-${pkgver}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DUSE_QT5=YES ..
  make
}

package() {
  cd "${srcdir}/tufao-${pkgver}/build"
  make DESTDIR="$pkgdir" install
}
