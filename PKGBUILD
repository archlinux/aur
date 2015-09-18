# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andreas B. Wagner <AndreasBWagner@gmail.com>

set -u
pkgname='docbook-sgml31'
pkgver='3.1'
pkgrel='1'
pkgdesc='Legacy docbook-sgml for docbook-utils.'
#arch=('i686' 'x86_64')
arch=('any')
url='http://www.docbook.org/sgml/'
license=('custom')
depends=('sgml-common')
#makedepends=('unzip')
install='docbook-sgml.install'
source=("http://www.docbook.org/sgml/${pkgver}/docbk31.zip")
sha256sums=('20261d2771b9a052abfa3d8fab1aa62be05791a010281c566f9073bf0e644538')

package() {
  set -u
  local DTDDIR="usr/share/sgml/docbook-sgml-${pkgver}"

  mkdir -pv "${pkgdir}/${DTDDIR}"
  #chown -R 0:0 ./
  cp -pv docbook.cat "${pkgdir}/${DTDDIR}/catalog"
  cp -pav *.dtd *.mod *.dcl "${pkgdir}/${DTDDIR}"
  set +u
}
set +u
