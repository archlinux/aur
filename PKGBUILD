# $Id: PKGBUILD 276082 2017-12-26 02:22:10Z eschwartz $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: damir <damir@archlinux.org>
# Contributor: Aurelien Gateau <aurelien.gateau@free.fr>

pkgname=wput
pkgver=0.6.2
pkgrel=3
pkgdesc="A command line tool to upload files to FTP site, the opposite to wget"
arch=('x86_64')
url="http://wput.sourceforge.net/"
depends=('gnutls>=2.4.1')
license=('GPL')
source=("https://downloads.sourceforge.net/sourceforge/wput/wput-${pkgver}.tgz")
md5sums=('a14c4c13d91d04d6119bdc977e8a8bdf')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  install -m755 -d "$pkgdir"/usr/bin
  install -m755 -d "$pkgdir"/usr/share/man/man1
  make prefix="$pkgdir"/usr install
  ln -sf wput "$pkgdir"/usr/bin/wdel
}
