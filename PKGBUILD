# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=ooc
pkgver=1.3a
pkgrel=1
pkgdesc="A kit to program in C in an object-oriented manner."
arch=('i686' 'x86_64')
url="http://ooc-coding.sourceforge.net/"
license=('LGPL')
source=(http://downloads.sourceforge.net/project/ooc-coding/source//${pkgname}-${pkgver}.tar.gz)
options=(staticlibs)
md5sums=('30019cbed04a410cb3c48228086e7af0')
sha256sums=('307d103de350e1038c4c915a423e313123e9b1b9a48d92e53ceca915a7b4923d')
sha384sums=('ed6279aa7f560c9749cce12573d17804e3941db9dccaf285881f86338b63d73038238e375ada61878fbc5ecb60676a18')
sha512sums=('76473b70fe2641a3a9cb478c392fa7674bc67800e6ffd5ae67760302a7f1af4d4a6b47ebd9c674a7998b9431b1d38f93caa66e136c7c9ac88ae20795e4955467')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
