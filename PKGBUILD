# Maintainer: knightzx <cuongvdtz@gmail.com>

pkgname=hakuneko
pkgver=1.4.1
pkgrel=1
pkgdesc="Manga Downloader for Linux and Windows"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/hakuneko/"
license=('MIT')
depends=('wxgtk' 'curl' 'webkitgtk2')
install=hakuneko.install
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}_${pkgver}_src.tar.gz)
md5sums=('5b246230a3231f9774d5613d86310968')

build() {
  cd ${srcdir}/${pkgname}_${pkgver}_src

  ./configure --prefix=/usr 
  make
}

package() {
  cd ${srcdir}/${pkgname}_${pkgver}_src

  install -d ${pkgdir}/usr/bin
  make DESTDIR=${pkgdir} install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
