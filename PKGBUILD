# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=bennugd-core
pkgver=325
pkgrel=1
pkgdesc="a programming language to create games (Fenix successor) - core"
arch=('i686')
url="http://sourceforge.net/projects/bennugd/"
license=('GPL')
depends=('libdes' 'openssl')
source=("http://sourceforge.net/code-snapshots/svn/b/be/bennugd/code/bennugd-code-${pkgver}.zip")
md5sums=('212a258c03125695e617e0bb08a96c51')

build() {
  cd $srcdir/bennugd-code-${pkgver}/core
  chmod +x ./configure
  ./configure --prefix=/usr
  find . -name Makefile -print0 | xargs -0 sed -i 's/--as-needed//'
  make
}

package() {
  cd $srcdir/bennugd-code-${pkgver}/core
  make DESTDIR=${pkgdir} install
}
