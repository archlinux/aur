# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: morpheusthewhite <zffromGerace@hotmail.it>

pkgname=ddd
pkgver=3.4.0
pkgrel=12
pkgdesc="A graphical front-end for command-line debuggers such as GDB, JDB, pydb, perl debugger..."
arch=('x86_64')
url="http://www.gnu.org/software/ddd/"
license=('GPL3' 'LGPL3')
depends=('gcc-libs' 'openmotif' 'libxaw')
optdepends=('gdb: to use the Gnu debugger' 
        'java-runtime-openjdk: to use the Java debugger' 
        'pydb: to use the Python debugger' 
        'perl: to use the Perl debugger')
source=(http://ftp.gnu.org/gnu/ddd/${pkgname}-${pkgver}.tar.gz)
sha1sums=('cf01bd6727a2b957ae27796bb807298bb34fbbb0')
  
prepare() {
  cd ${pkgname}-${pkgver}
}

build() {
  cd ${pkgname}-${pkgver}
  LIBS+="-pthread" ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 icons/ddd.xpm "${pkgdir}/usr/share/pixmaps/ddd.xpm"
}
