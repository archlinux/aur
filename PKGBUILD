# Maintainer: Thiago Yukio Kikuchi Oliveira <stratust@gmail.com>

pkgname=globus
pkgver=5.2.0
pkgrel=1
pkgdesc="Toolkit for building grids"
arch=('i686' 'x86_64')
url="http://www.globus.org/"
license=('APACHE')
source=(http://www.globus.org/ftppub/gt5/5.2/5.2.0/installers/src/gt5.2.0-all-source-installer.tar.gz)
md5sums=(f27553b377277eb625f29db1384c5c7a)
install="globus.install"

build() {
  cd $srcdir/gt$pkgver-all-source-installer
  export GLOBUS_LOCATION=/opt/globus
  ./configure --prefix=$pkgdir$GLOBUS_LOCATION
  make
}

package() {
	 cd $srcdir/gt$pkgver-all-source-installer
	 make install
}
