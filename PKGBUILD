# Maintainer: Danijel Tasov <aur@rbfh.de>
pkgname=qsf
pkgver=1.2.11
pkgrel=1
pkgdesc="small and fast bayesian spam filter"
url="https://www.ivarch.com/programs/qsf/"
license=("PerlArtistic")
depends=('gdbm')
arch=('i686' 'x86_64')
source=("https://www.ivarch.com/programs/sources/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('5e0f7554edb6b875fcf33571db236f0a274d14ca6a0b4826f7ddf528dfe475c0c5b91a380427b63dbaa180d9787e4b00e8208aae81f7c09f5cc2c27d46e9b87d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --without-mysql
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
