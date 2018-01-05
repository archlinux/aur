# $Id: PKGBUILD 197831 2016-12-03 18:27:47Z arojas $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=man-pages-it
pkgver=4.08
pkgrel=1
pkgdesc="Italian man pages"
arch=('any')
url="http://www.pluto.it/ildp/man/index.html"
license=('GPL')
depends=('man-pages')
options=('!emptydirs')
source=("ftp://ftp.pluto.it/pub/pluto/ildp/man/$pkgname-$pkgver.tar.xz")
md5sums=('869cf8ff2aa5c11b8d15d1ba7a47f4fa')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make MANDIR=${pkgdir}/usr/share/man/it
  make MANDIR=${pkgdir}/usr/share/man/it install

  # remove conflicts with other man pages
  rm -f $pkgdir/usr/share/man/it/man5/passwd.5*
}
