pkgname=otrs
pkgver=3.1.7
itsmver=3.1.4
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
         '8ec062d87ba84e5bc9eba8055bae686d'
         '2c5539215b37220692df7b669a84ec52'
         '948b8268b4f8bb0dcf6875f670a3674c'
         'b930a1319993c21cd35689a760ac017c'
         '7df599ad98a12cd34b6cc32ebe915c07'
         '6b0a25d8c2c1540322f392a393f6d4b7'
         '0bef432d12e66c256389bedce61bf331'
         'e32e04216ba0d88ce9b4903e01baf15f')
sha1sums=('247719410cfd3b7a89843f2a7ae6820507f2b22d'
          '69bc6abcdcb3df6e67181dc0644d0088007c6d78'
          '042963f429b93ebdebae82762b2db32fc0d68bde'
          '9dd9d3d5379afb41c0abeeb50a3af5ec89daf318'
          '9b4b71f5968805fa193e12165a4df49b1ea38de7'
          'fc96ee5c9f83f4a2908776adb410fae442dfaf93'
          '86b731456456fe6e31f078518e9199ed2c70ffde'
          'df5ecffe64a5af82da2a3fb7c6c7753d053f8c7f'
          'fc85ba98229f032302c5a70bd6b130865d48152b'
          '3bcef2630edd850fab98e9e1e84f5625b78c1076')