# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: N. Izumi - izmntuk
# Contributor: Dmitry Nosachev - quartz64 at gmail dot com

pkgname='ddpt'
pkgver='0.97'
pkgrel='1'
pkgdesc="Variant of the standard 'dd' for SCSI/storage devices"
arch=('i686' 'x86_64')
url='http://sg.danny.cz/sg/ddpt.html'
license=('BSD')
depends=('sg3_utils')
source=("http://sg.danny.cz/sg/p/${pkgname}-${pkgver}.tar.xz")
md5sums=('5217a3a2f316b8d1e5ea6e4645cd8ec6')
sha1sums=('2ab1df78583efffdf198ed016453ce9b25a3c1c5')
sha256sums=('13686b1b6e19b75cfafe731ee338b4d45554b81c2a3b6c7a57e406e75b4472ce')

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

