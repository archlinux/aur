# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: Andreas B. Wagner <AndreasBWagner@gmail.com>
# Contributor: Suat SARIALP <muhendis.suat@gmail.com>

set -u
pkgname='docbook-xml-dtd'
pkgver='4.4'
pkgrel='2'
pkgdesc='Docbook DTD for XML'
#arch=('i686' 'x86_64')
arch=('any')
url='http://www.docbook.org/xml/index.html'
license=('X11')
depends=('sgml-common')
makedepends=('docbook-xsl' 'libxml2')
replaces=('docbook-xml')
install="${pkgname}.install"
source=("http://www.docbook.org/xml/${pkgver}/docbook-xml-${pkgver}.zip" 'catalog'
        'build-docbook-catalog-1.2' 'deleteDocBookCatalog')
sha256sums=('02f159eb88c4254d95e831c51c144b1863b216d909b5ff45743a1ce6f5273090'
            '7fd2043a386f6f869da85a4a74926b330299e7c2423003d8a300ff1b2a85c906'
            'f0aa311db9bde4fb40d8062535d13e27d94c3996e46615a17d33751d91b6e83a'
            'a228dbbfc737fbcf3d297c7ac84bef466b50156c8931b4ee1613b5f7f994c3fa')

package() {
  set -u
  sed -i -e '1i\\OVERRIDE YES' 'docbook.cat'

  mkdir -p "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent"
  local each
  for each in  *.dtd *.mod 'docbook.cat' 'catalog.xml' 'catalog'; do
    install -Dpm755 "${each}" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}"
  done
    install -Dpm755 "${srcdir}/build-docbook-catalog-1.2" "${pkgdir}/usr/bin/build-docbook-catalog"
    install -Dpm755 "${srcdir}/deleteDocBookCatalog" "${pkgdir}/usr/bin/deleteDocBookCatalog"
    cp "${srcdir}/ent/isoamsa.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-amsa.ent"
    cp "${srcdir}/ent/isoamsb.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-amsb.ent"
    cp "${srcdir}/ent/isoamsc.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-amsc.ent"
    cp "${srcdir}/ent/isoamsn.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-amsn.ent"
    cp "${srcdir}/ent/isoamso.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-amso.ent"
    cp "${srcdir}/ent/isoamsr.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-amsr.ent"
    cp "${srcdir}/ent/isobox.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-box.ent"
    cp "${srcdir}/ent/isocyr1.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-cyr1.ent"
    cp "${srcdir}/ent/isocyr2.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-cyr2.ent"
    cp "${srcdir}/ent/isodia.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-dia.ent"
    cp "${srcdir}/ent/isogrk1.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-grk1.ent"
    cp "${srcdir}/ent/isogrk2.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-grk2.ent"
    cp "${srcdir}/ent/isogrk3.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-grk3.ent"
    cp "${srcdir}/ent/isogrk4.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-grk4.ent"
    cp "${srcdir}/ent/isolat1.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-lat1.ent"
    cp "${srcdir}/ent/isolat2.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-lat2.ent"
    cp "${srcdir}/ent/isonum.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-num.ent"
    cp "${srcdir}/ent/isopub.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-pub.ent"
    cp "${srcdir}/ent/isotech.ent" "${pkgdir}/usr/share/sgml/docbook/xml-dtd-${pkgver}/ent/iso-tech.ent"
  set +u
}
set +u
