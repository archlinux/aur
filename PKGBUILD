pkgname=hakuneko
pkgver=1.3.9
pkgrel=1
pkgdesc="Manga Downloader for Linux and Windows"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/hakuneko/"
license=('MIT')
depends=('wxgtk2.8' 'curl' 'openssl')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}_${pkgver}_src.tar.gz)
md5sums=('a28bbfaca0e0c8bfdc35f2dceebf85c3')

build() {
	cd ${srcdir}/${pkgname}_${pkgver}_src

  sed -i 's/wx-config /wx-config-2.8 /' config_default.sh
  #export WX_CONFIG=/usr/bin/wx-config-2.8
	./configure --prefix=/usr 
	make
}

package() {
  cd ${srcdir}/${pkgname}_${pkgver}_src
  install -d ${pkgdir}/usr/bin
	make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
