# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Holger Rauch < holger dot rauch at posteo dot de >
# based on CentOS 7 rpm
# http://pkgs.org/centos-7/centos-x86_64/docbook5-schemas-5.1-10.el7.noarch.rpm.html
# hrauch: 5.1 has become an OASIS standard (hence the 'os' in the filename)
#         in the meantime

pkgname=docbook5-schemas
pkgver=5.1
pkgrel=2
pkgdesc="Norman Walsh's schemas (DTD, Relax NG, W3C schema) for Docbook 5.X"
arch=('any')
depends=('libxml2')
makedepends=('unzip')
url="http://docs.oasis-open.org/docbook/docbook/v5.1/os/docbook-v5.1-os.html"
license=('PublicDomain')
source=(http://docs.oasis-open.org/docbook/docbook/v${pkgver}/os/docbook-v${pkgver}-os.zip)
sha256sums=('b3f3413654003c1e773360d7fc60ebb8abd0e8c9af8e7d6c4b55f124f34d1e7f')
sha512sums=('b55f8eda4dcff9d4ebd31876bc33c244ef3884afc167da1425531266963ba64000fbe619ec7c049ae65c0aab864a5a7228caef08b53f546e2686296d97190873')
install=docbook5-schemas.install

_datadir=/usr/share

build() {
  cd "$srcdir"

  _catalog=docbook-5.xml

  xmlcatalog --create --noout ${_catalog}

  for v in ${pkgver}; do
    # DTD
#    xmlcatalog --noout --add "public" \
#      "-//OASIS//DTD DocBook XML ${v}//EN" \
#      "file://${_datadir}/xml/docbook5/schema/dtd/${v}/docbook.dtd" ${_catalog}
#    xmlcatalog --noout --add "system" \
#      "http://www.oasis-open.org/docbook/xml/${v}/dtd/docbook.dtd" \
#      "file://${_datadir}/xml/docbook5/schema/dtd/${v}/docbook.dtd" ${_catalog}
#    xmlcatalog --noout --add "system" \
#      "http://docbook.org/xml/${v}/dtd/docbook.dtd" \
#      "file://${_datadir}/xml/docbook5/schema/dtd/${v}/docbook.dtd" ${_catalog}
    # RNG
    xmlcatalog --noout --add "uri" \
      "http://www.oasis-open.org/docbook/xml/${v}/rng/docbook.rng" \
      "file://${_datadir}/xml/docbook5/schema/rng/${v}/docbook.rng" ${_catalog}
    xmlcatalog --noout --add "uri" \
      "http://docbook.org/xml/${v}/rng/docbook.rng" \
      "file://${_datadir}/xml/docbook5/schema/rng/${v}/docbook.rng" ${_catalog}
    # RNG+XInclude
    xmlcatalog --noout --add "uri" \
      "http://www.oasis-open.org/docbook/xml/${v}/rng/docbookxi.rng" \
      "file://${_datadir}/xml/docbook5/schema/rng/${v}/docbookxi.rng" ${_catalog}
    xmlcatalog --noout --add "uri" \
      "http://docbook.org/xml/${v}/rng/docbookxi.rng" \
      "file://${_datadir}/xml/docbook5/schema/rng/${v}/docbookxi.rng" ${_catalog}
    # RNC
    xmlcatalog --noout --add "uri" \
      "http://www.oasis-open.org/docbook/xml/${v}/rnc/docbook.rnc" \
      "file://${_datadir}/xml/docbook5/schema/rng/${v}/docbook.rnc" ${_catalog}
    xmlcatalog --noout --add "uri" \
      "http://docbook.org/xml/${v}/rng/docbook.rnc" \
      "file://${_datadir}/xml/docbook5/schema/rng/${v}/docbook.rnc" ${_catalog}
    # RNC+XInclude
    xmlcatalog --noout --add "uri" \
      "http://www.oasis-open.org/docbook/xml/${v}/rnc/docbookxi.rnc" \
      "file://${_datadir}/xml/docbook5/schema/rng/${v}/docbookxi.rnc" ${_catalog}
    xmlcatalog --noout --add "uri" \
      "http://docbook.org/xml/${v}/rng/docbookxi.rnc" \
      "file://${_datadir}/xml/docbook5/schema/rng/${v}/docbookxi.rnc" ${_catalog}
    # XSD
#    xmlcatalog --noout --add "uri" \
#      "http://www.oasis-open.org/docbook/xml/${v}/xsd/docbook.xsd" \
#      "file://${_datadir}/xml/docbook5/schema/xsd/${v}/docbook.xsd" ${_catalog}
#    xmlcatalog --noout --add "uri" \
#      "http://docbook.org/xml/${v}/xsd/docbook.xsd" \
#      "file://${_datadir}/xml/docbook5/schema/xsd/${v}/docbook.xsd" ${_catalog}
    # XSD + XInclude
#    xmlcatalog --noout --add "uri" \
#      "http://www.oasis-open.org/docbook/xml/${v}/xsd/docbookxi.xsd" \
#      "file://${_datadir}/xml/docbook5/schema/xsd/${v}/docbookxi.xsd" ${_catalog}
#    xmlcatalog --noout --add "uri" \
#      "http://docbook.org/xml/${v}/xsd/docbookxi.xsd" \
#      "file://${_datadir}/xml/docbook5/schema/xsd/${v}/docbookxi.xsd" ${_catalog}
#    xmlcatalog --noout --add "uri" \
#      "http://www.oasis-open.org/docbook/xml/${v}/xsd/xi.xsd" \
#      "file://${_datadir}/xml/docbook5/schema/xsd/${v}/xi.xsd" ${_catalog}
#    xmlcatalog --noout --add "uri" \
#      "http://docbook.org/xml/${v}/xsd/xi.xsd" \
#      "file://${_datadir}/xml/docbook5/schema/xsd/${v}/xi.xsd" ${_catalog}
    # XLink + XML
#    xmlcatalog --noout --add "uri" \
#      "http://www.oasis-open.org/docbook/xml/${v}/xsd/xlink.xsd" \
#      "file://${_datadir}/xml/docbook5/schema/xsd/${v}/xlink.xsd" ${_catalog}
#    xmlcatalog --noout --add "uri" \
#      "http://docbook.org/xml/${v}/xsd/xlink.xsd" \
#      "file://${_datadir}/xml/docbook5/schema/xsd/${v}/xlink.xsd" ${_catalog}
#    xmlcatalog --noout --add "uri" \
#      "http://www.oasis-open.org/docbook/xml/${v}/xsd/xml.xsd" \
#      "file://${_datadir}/xml/docbook5/schema/xsd/${v}/xml.xsd" ${_catalog}
#    xmlcatalog --noout --add "uri" \
#      "http://docbook.org/xml/${v}/xsd/xml.xsd" \
#      "file://${_datadir}/xml/docbook5/schema/xsd/${v}/xml.xsd" ${_catalog}
    # Schematron
    xmlcatalog --noout --add "uri" \
      "http://www.oasis-open.org/docbook/xml/${v}/sch/docbook.sch" \
      "file://${_datadir}/xml/docbook5/schema/sch/${v}/docbook.sch" ${_catalog}
    xmlcatalog --noout --add "uri" \
      "http://docbook.org/xml/${v}/sch/docbook.sch" \
      "file://${_datadir}/xml/docbook5/schema/sch/${v}/docbook.sch" ${_catalog}
  done

  # ---------------------
  # Build XML catalog files for each Schema
  for v in ${pkgver}; do
#    for s in dtd rng sch xsd; do
     for s in schemas/rng schemas/sch; do
      _schema_catalog=${s}/catalog.xml
      xmlcatalog --noout --create ${_schema_catalog}
      case $s in
#        dtd)
#          xmlcatalog --noout --add "public" \
#            "-//OASIS//DTD DocBook XML ${v}//EN" \
#            "docbook.dtd" ${_schema_catalog}
#          xmlcatalog --noout --add "system" \
#            "http://www.oasis-open.org/docbook/xml/${v}/dtd/docbook.dtd" \
#            "docbook.dtd" ${_schema_catalog}
#          ;;
        sch)
          xmlcatalog --noout --add "uri" \
            "http://docbook.org/xml/${v}/${s}/docbook.${s}" \
            "docbook.${s}" ${_schema_catalog}
          xmlcatalog --noout --add "uri" \
            "http://www.oasis-open.org/docbook/xml/${v}/${s}/docbook.${s}" \
            "docbook.${s}" ${_schema_catalog}
          ;;
        rng)
          xmlcatalog --noout --add "uri" \
            "http://docbook.org/xml/${v}/${s}/docbook.${s}" \
            "docbook.${s}" ${_schema_catalog}
          xmlcatalog --noout --add "uri" \
            "http://www.oasis-open.org/docbook/xml/${v}/${s}/docbook.${s}" \
            "docbook.${s}" ${_schema_catalog}
          xmlcatalog --noout --add "uri" \
            "http://docbook.org/xml/${v}/${s}/docbookxi.${s}" \
            "docbookxi.${s}" ${_schema_catalog}
          xmlcatalog --noout --add "uri" \
            "http://www.oasis-open.org/docbook/xml/${v}/${s}/docbookxi.${s}" \
            "docbookxi.${s}" ${_schema_catalog}
          xmlcatalog --noout --add "uri" \
            "http://docbook.org/xml/${v}/${s}/docbook.rnc" \
            "docbook.rnc" ${_schema_catalog}
          xmlcatalog --noout --add "uri" \
            "http://www.oasis-open.org/docbook/xml/${v}/${s}/docbook.rnc" \
            "docbook.rnc" ${_schema_catalog}
          xmlcatalog --noout --add "uri" \
            "http://docbook.org/xml/${v}/${s}/docbookxi.rnc" \
            "docbookxi.rnc" ${_schema_catalog}
          xmlcatalog --noout --add "uri" \
            "http://www.oasis-open.org/docbook/xml/${v}/${s}/docbookxi.rnc" \
            "docbookxi.rnc" ${_schema_catalog}
          ;;
#        xsd)
#          # http://www.oasis-open.org/docbook/xml/5.1/xsd/docbookxi.xsd
#          # http://www.oasis-open.org/docbook/xml/5.1/xsd/xlink.xsd
#          xmlcatalog --noout --add "uri" \
#            "http://docbook.org/xml/${v}/${s}/docbook.${s}" \
#            "docbook.${s}" ${_schema_catalog}
#          xmlcatalog --noout --add "uri" \
#            "http://www.oasis-open.org/docbook/xml/${v}/${s}/docbook.${s}" \
#            "docbook.${s}" ${_schema_catalog}
#          xmlcatalog --noout --add "uri" \
#            "http://docbook.org/xml/${v}/${s}/docbookxi.${s}" \
#            "docbookxi.${s}" ${_schema_catalog}
#          xmlcatalog --noout --add "uri" \
#            "http://www.oasis-open.org/docbook/xml/${v}/${s}/docbookxi.${s}" \
#            "docbookxi.${s}" ${_schema_catalog}
          # XLink + XML:
#          xmlcatalog --noout --add "uri" \
#            "http://docbook.org/xml/${v}/${s}/xlink.xsd" \
#            "xlink.xsd" ${_schema_catalog}
#          xmlcatalog --noout --add "uri" \
#            "http://www.oasis-open.org/docbook/xml/${v}/${s}/xlink.xsd" \
#            "xlink.xsd" ${_schema_catalog}
#          xmlcatalog --noout --add "uri" \
#            "http://docbook.org/xml/${v}/${s}/xml.xsd" \
#            "xml.xsd" ${_schema_catalog}
#          xmlcatalog --noout --add "uri" \
#            "http://www.oasis-open.org/docbook/xml/${v}/${s}/xml.xsd" \
#            "xml.xsd" ${_schema_catalog}
#          ;;
      esac
    done
  done
}

package() {
  cd "$srcdir"

  _docbook5dir="${pkgdir}${_datadir}/xml/docbook5"
  for v in ${pkgver}; do
#    mkdir -p ${_docbook5dir}/schema/dtd/${v}
    mkdir -p ${_docbook5dir}/schema/rng/${v}
    mkdir -p ${_docbook5dir}/schema/sch/${v}
#    mkdir -p ${_docbook5dir}/schema/xsd/${v}
#    install -m644 dtd/* ${_docbook5dir}/schema/dtd/${v}
    install -m644 schemas/rng/* ${_docbook5dir}/schema/rng/${v}
    install -m644 schemas/sch/* ${_docbook5dir}/schema/sch/${v}
#    install -m644 xsd/* ${_docbook5dir}/schema/xsd/${v}
  done
  mkdir -p "$pkgdir/usr/bin"
  install -m755 tools/db4-entities.pl "$pkgdir/usr/bin"
  mkdir -p "${_docbook5dir}/stylesheet/upgrade"
  install -m644 tools/db4-upgrade.xsl "${_docbook5dir}/stylesheet/upgrade"

  mkdir -p "$pkgdir/etc/xml"
  install -m644 docbook-5.xml "$pkgdir/etc/xml/docbook-5.xml"
}
