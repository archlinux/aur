pkgname=otrs
pkgver=3.1.10
itsmver=3.1.6
pkgrel=1
pkgdesc="OTRS is the leading open-source Help Desk and IT Service Management (ITSM)"
arch=("any")
options=("emptydirs")
url="http://www.otrs.com/"
license=("GPLv3")
depends=("apache>=2"
         "mariadb>=5.5"
         "perl>=5.8.8"
         "mod_perl>=2"
         "perl-crypt-ssleay"
         "perl-timedate"
         "perl-dbd-mysql"
         "perl-gdgraph"
         "perl-json"
         "perl-json-xs"
         "perl-lwp-protocol-https"
         "perl-mail-imapclient"
         "perl-apache-dbi"
         "perl-dbd-pg"
         "perl-net-dns"
         "perl-net-imap-simple-ssl"
         "perl-net-smtp-ssl"
         "perl-dbd-odbc" 
         "perl-net-smtp-tls-butmaintained"
         "perl-ldap"
         "perl-pdf-api2"
         "perl-yaml-libyaml"
         "perl-text-csv-xs"
         "perl-xml-parser")
backup=("etc/httpd/conf/extra/${pkgname}.conf")
install="${pkgname}.install"
source=("${pkgname}.conf"
        "${pkgname}.install"
        "http://ftp.otrs.org/pub/otrs/${pkgname}-${pkgver}.tar.gz"
        "http://ftp.otrs.org/pub/otrs/itsm/packages31/ITSMCore-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages31/GeneralCatalog-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages31/ITSMChangeManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages31/ITSMConfigurationManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages31/ITSMIncidentProblemManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages31/ITSMServiceLevelManagement-${itsmver}.opm"
        "http://ftp.otrs.org/pub/otrs/itsm/packages31/ImportExport-${itsmver}.opm")
_HTMLPATH="srv/http/${pkgname}"

package() {
  mkdir -p "${pkgdir}/${_HTMLPATH}/"
  cp -r ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/${_HTMLPATH}/
  _EXTDIR="${pkgdir}/${_HTMLPATH}/extentions"
  mkdir -p "${_EXTDIR}"
  install -D -m 0640 "${srcdir}/ITSMCore-${itsmver}.opm" \
                     "${_EXTDIR}/ITSMCore-${itsmver}.opm"
  install -D -m 0640 "${srcdir}/GeneralCatalog-${itsmver}.opm" \
                     "${_EXTDIR}/GeneralCatalog-${itsmver}.opm"
  install -D -m 0640 "${srcdir}/ITSMChangeManagement-${itsmver}.opm" \
                     "${_EXTDIR}/ITSMChangeManagement-${itsmver}.opm"
  install -D -m 0640 "${srcdir}/ITSMConfigurationManagement-${itsmver}.opm" \
                     "${_EXTDIR}/ITSMConfigurationManagement-${itsmver}.opm"
  install -D -m 0640 "${srcdir}/ITSMIncidentProblemManagement-${itsmver}.opm" \
                     "${_EXTDIR}/ITSMIncidentProblemManagement-${itsmver}.opm"
  install -D -m 0640 "${srcdir}/ITSMServiceLevelManagement-${itsmver}.opm" \
                     "${_EXTDIR}/ITSMServiceLevelManagement-${itsmver}.opm"
  install -D -m 0640 "${srcdir}/ImportExport-${itsmver}.opm" \
                     "${_EXTDIR}/ImportExport-${itsmver}.opm"
  install -D -m 0640 "${srcdir}/${pkgname}.conf" \
                     "${pkgdir}/etc/httpd/conf/extra/${pkgname}.conf"
  chown -R 33:33 "${pkgdir}/${_HTMLPATH}/"
  chmod -R u=rwX,g=r,o=r "${pkgdir}/${_HTMLPATH}/"
}
md5sums=('ebfeabfba189816c4b10861289406840'
         'f0ae9b90828825382720f4422aa9c81d'
         'fdadbc1c8e7a4d62d7e3afbc3c712702'
         '56ca1566b21aca220b8c404fdcf8f7cb'
         '8d69c34e3639764f56b76378fb1a7b1f'
         'a0b5c0086dbdff853883041cae8c8629'
         '6a4214dad1ed9ec0eb3e908be46f64a8'
         'a03c0af712d8dabd1c15f209d3a220b7'
         'c86ccfd1d3de1e1c385accb3cc790262'
         'fd913c540e0fd2f689ad99b4add07bf2')
sha1sums=('247719410cfd3b7a89843f2a7ae6820507f2b22d'
          '69bc6abcdcb3df6e67181dc0644d0088007c6d78'
          '91fa603052977ffc63948aeb33c22398645ca35b'
          '84e49f7dbae79f50acdc7f2aefa7f7e7a92da480'
          '6ef5c495dc5da33ca6768a2c3771bc41d76e3556'
          'e11a82665515ba82ed220c5b8ed5e56cc201b953'
          '3fae708ec3b6fb08a2793d50ef2c65443573132d'
          '5ec817724ba07af4e9c31368a122ed50946b0664'
          '2a5c5e557d82b20def1e8163aad46a9cbbbe347f'
          'd54d6e5f3f2e58d559f596f9f8ff7be7e4301840')