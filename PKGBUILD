# Maintainer: Mikael Blomstrand <gmail: kmbloms>

pkgname=abi-dumper
pkgver=1.2
pkgrel=1
pkgdesc="Dump ABI of an ELF object containing DWARF debug info."
arch=('i686' 'x86_64')
url="https://github.com/lvc/abi-dumper"
license=('LGPL')
# Dependencies as listed in INSTALL.
depends=(perl elfutils binutils vtable-dumper ctags)
conflicts=('abi-compliance-checker<2.2')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/lvc/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('e5ddc0ece3970ff0a34a984faac8e9f5')
sha1sums=('c4bfbcf878877b80c12c18cc5998b9184514887a')
sha256sums=('8a9858c91b4e9222c89b676d59422053ad560fa005a39443053568049bd4d27e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr"
  perl Makefile.pl -install --prefix=/usr --destdir="${pkgdir}"
}
