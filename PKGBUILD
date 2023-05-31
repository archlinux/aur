# Maintainer: Danijel Tasov <aur@rbfh.de>
pkgname=qsf
pkgver=1.2.15
pkgrel=1
pkgdesc="small and fast bayesian spam filter"
url="https://www.ivarch.com/programs/qsf/"
license=("PerlArtistic")
depends=('gdbm')
arch=('i686' 'x86_64')
source=("https://www.ivarch.com/programs/sources/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('d4607e746cef57645aefc94599ff186c2b4f8ad1d971cf016b8effb29a138b36a073004860c41e477ac8efb713553952a5ade4240efdaf6c85f46882f9c5eac5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --without-mysql
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=8 sts=2 ai sw=2 et:
