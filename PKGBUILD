# Contributor: morpheusthewhite <zffromGerace@hotmail.it>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=ddd
pkgver=3.4.1
pkgrel=1
pkgdesc="A graphical front-end for command-line debuggers such as GDB, JDB, pydb, perl debugger..."
arch=('x86_64')
url="http://www.gnu.org/software/ddd/"
license=('GPL3' 'LGPL3')
depends=('gcc-libs' 'openmotif' 'libxaw')
optdepends=('gdb: to use the Gnu debugger' 
        'java-runtime-openjdk: to use the Java debugger' 
        'perl: to use the Perl debugger')
source=(http://ftp.gnu.org/gnu/ddd/${pkgname}-${pkgver}.tar.gz)
sha1sums=('0bcb90b8ded114b3953eb2c5f77f3c636f317cdd')
  
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
