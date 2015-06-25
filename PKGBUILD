# Maintainer: Bert Muennich <ber.t at gmx.com>

pkgname=c_count
pkgver=7.12
pkgrel=1
pkgdesc="Counts lines, statements, other simple measures of C/C++ source programs."
arch=('i686' 'x86_64')
url="http://invisible-island.net/c_count/"
license=('custom')
depends=()
conflicts=('sloccount')
source=(ftp://invisible-island.net/${pkgname}/${pkgname}-${pkgver}.tgz)
md5sums=('09dca0f2fc524faa1f0a4573a982f703')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
