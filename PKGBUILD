# Maintainer: Mikael Blomstrand <mbloms ÅT kth DÖT se>

pkgname=abi-dumper
pkgver=1.1
pkgrel=1
pkgdesc="Dump ABI of an ELF object containing DWARF debug info."
arch=('i686' 'x86_64')
url="https://github.com/lvc/abi-dumper"
license=('LGPL')
# Dependencies as listed in INSTALL.
depends=(perl elfutils binutils vtable-dumper ctags)
conflicts=('abi-compliance-checker<2.2')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/lvc/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('b4540063202fe7bd1d4fee58b31a2b22')
sha1sums=('46b3ebf9fbd42d48aa33bde1b5d84638b6893480')
sha256sums=('ef63201368e0d76a29d2f7aed98c488f6fb71898126762d65baed1e762988083')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr"
  perl Makefile.pl -install --prefix=/usr --destdir="${pkgdir}"
}
