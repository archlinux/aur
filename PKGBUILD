# Contributor: Dmitry Nosachev - quartz64 at gmail dot com
# Maintainer: N. Izumi - izmntuk

pkgname='ddpt'
pkgver='0.96'
pkgrel='1'
pkgdesc="Variant of the standard 'dd' for SCSI/storage devices"
arch=('i686' 'x86_64')
url='http://sg.danny.cz/sg/ddpt.html'
license=('BSD')
depends=('sg3_utils')
source=("http://sg.danny.cz/sg/p/${pkgname}-${pkgver}.tar.xz")
md5sums=('4166b452421276d2a9b3d9071d4df7ad')
sha1sums=('049322b132e99453d43af998f20700967361335f')
sha256sums=('63e28a191568af0273624f5ed77428820fcc289b99aa604ac7682b2f98a143ca')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix='/usr'
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}/"
  install -d "${pkgdir}/usr/share/"{doc,licenses}/"${pkgname}"
  install -m644 'AUTHORS' 'ChangeLog' 'CREDITS' 'README' 'TODO' 'doc/ddpt_examples.txt' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}"
}

