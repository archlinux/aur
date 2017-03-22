# Maintainer: Tatsunori Aoki <ginjiro.135 at gmail dot com>
# Contritubor: Tomokazu Takada <wacky.mk0 at gmail dot com>

pkgname=lv
pkgver=4.51
pkgrel=6
pkgdesc="a Powerful Multilingual File Viewer / Grep"
depends=('ncurses')
makedepends=('autoconf')
license=('GPL')
arch=('i686' 'x86_64')
source=(https://web.archive.org/web/20130405191850/http://www.ff.iij4u.or.jp/~nrt/freeware/lv451.tar.gz)
md5sums=('85b70ae797f935741ec9a1cbe92f00e9')
url="http://www.ff.iij4u.or.jp/~nrt/lv/index.html"

build() {
  cd ${srcdir}/lv451/src
  autoconf
  cd ${srcdir}/lv451/build
  ../src/configure --prefix='/usr'
  make
}

package() {
  cd ${srcdir}/lv451/build
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/share/man/man1
  make prefix=${pkgdir}/usr install
}
