# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: noonov <noonov@gmail.com>

pkgname=cueplot
pkgver=0.0.8
pkgrel=6
pkgdesc="A GUI front-end to gnuplot, which uses Qt library"
arch=('i686' 'x86_64')
url="http://sourceforge.jp/projects/cueplot/"
license=('GPL2')
depends=('qt4' 'gnuplot')
makedepends=('cmake')
conflicts=('cueplot-svn')
source=(http://dl.sourceforge.jp/cueplot/43138/${pkgname}-${pkgver}.tar.bz2)
md5sums=('2835cae50eb47aee570ee4003198f9e5')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}
