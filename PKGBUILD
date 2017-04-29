# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Pantelis Panayiotou <p.panayiotou@gmail.com>

# Bug: "Query Printer for Default Options" doesn't work on printers without the Postscript option.

pkgname='openprinting-ppds-pxlmono-savin'
pkgver='20161206'
pkgrel='1'
pkgdesc="PPD files for Ricoh Savin PCL printers, supplied by Ricoh"
arch=('any')
url='http://www.openprinting.org/driver/pxlmono-Savin'
license=('MIT')
depends=('cups' 'ghostscript')
depends+=('cups-filters') # foomatic-rip
conflicts=('ppd-ricohh')
source=("http://www.openprinting.org/download/printdriver/components/lsb3.2/main/RPMS/noarch/${pkgname}-${pkgver}-1lsb3.2.noarch.rpm")
sha256sums=('76c160e69d09641b28410302fe9459a6f03fba3a9f38dabde9e2c4ef7d6eb879')

package() {
  install -D "${srcdir}/opt/OpenPrinting-Ricoh/ppds/Savin"/* -t "${pkgdir}/usr/share/cups/model/Savin/"
  install -D "${srcdir}/opt/OpenPrinting-Ricoh/doc/${pkgname}"/* -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
