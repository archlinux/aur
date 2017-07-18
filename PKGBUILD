# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lsi-msm
_pkgver=17.05.00-02
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc="LSI Logic MegaRAID Storage Manager Suite"
arch=('i686' 'x86_64')
url='http://www.avagotech.com/products/server-storage'
license=('custom:LSI' 'custom:TOG')
depends=('libxtst'
         'alsa-lib'
         'libnet'
         'libxslt'
         'unixodbc'
         'net-snmp'
         'perl-net-snmp'
         'perl-term-readkey'
         'xdg-utils'
         'gtk2'
         )
depends_i686=('libxi'
              'libxft'
              'libpng12'
              'libxinerama'
              'libjpeg6-turbo'
              'libxxf86vm'
              # 'xerces-c'
              )
depends_x86_64=('lib32-libxi'
                'lib32-libxft'
                'lib32-libpng12'
                'lib32-libxinerama'
                'lib32-libjpeg6-turbo'
                'lib32-libxxf86vm'
                # 'lib32-xerces-c'
                )
makedepends=('icu'
             'openslp'
             'sqlite'
             'lynx'
             )
          # OpenPegasus site don't like wget/curl. :/
DLAGENTS=('https::/usr/bin/lynx -accept_all_cookies -cmd_script=lynx_script_for_download_pegasus %u'
          'http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u')
source=('lynx_script_for_download_pegasus' #IMPORTANT for download pegasus zip. please don't move to other place
        'https://collaboration.opengroup.org/pegasus/documents/32572/pegasus-2.14.1.tar.gz'
        'msm_profile.sh'
        'LSI_StorSNMP.ini'
        'lsi_msm.service'
        'lsi_mrdsnmpd.service'
        'ld.so.lsi-msm.conf'
        'https://www.broadcom.com/docs-and-downloads/advanced-software/advanced-software-common-files/SLA_AdvancedSoftware.pdf'
        'http://pkgs.fedoraproject.org/cgit/rpms/tog-pegasus.git/plain/pegasus-2.7.0-PIE.patch'
        'http://pkgs.fedoraproject.org/cgit/rpms/tog-pegasus.git/plain/pegasus-2.9.0-no-rpath.patch'
        'http://pkgs.fedoraproject.org/cgit/rpms/tog-pegasus.git/plain/pegasus-2.13.0-gcc5-build.patch'
        'http://pkgs.fedoraproject.org/cgit/rpms/tog-pegasus.git/plain/pegasus-2.14.1-build-fixes.patch'
        'http://pkgs.fedoraproject.org/cgit/rpms/tog-pegasus.git/plain/pegasus-2.14.1-ssl-include.patch'
        'http://pkgs.fedoraproject.org/cgit/rpms/tog-pegasus.git/plain/pegasus-2.14.1-openssl-1.1-fix.patch'
        )
source_i686=("${pkgver}_Linux-x86_MSM.gz::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_Linux-32_MSM.gz")
source_x86_64=("${pkgver}_Linux-x64_MSM.gz::https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/${pkgver}_Linux-64_MSM.gz")
sha256sums=('72d24d357601b9df8a418a7e7851d3b55c32614394e5507146fe961e4712c5e8'
            '9f2f13a35da218f3cb6e8478246ff7c4d3010560bb4d5de9cbf4272d48e353fb'
            '11892783bc2569ad1f4bac0ec8f91f1e7e54c795f9b6454e93348a6ca0cf2a5b'
            '605adcb662fb457609e81fb8916da7e88541e81dd0c112a8bb569d84df189bff'
            'c33714f33698ab2aebb28b040ed78dba5efbda0429be51662fc635ba49fd235a'
            '98bfc8d174cd2b056353742dc52c40f56bb77676e816f33184ab1de3e8108cfd'
            '633c100edb3323eed256ea1247791104ad4622b4f234ccbc6723b0afd67706d5'
            '9be6a8818ea1dccec65d48b86dd0cc62009dc3886229e3dce41192a241bd55c3'
            'e3924bdb81a4dd2cedfb9c7ba669cb01b32f4c4e16b3af4c06f9a2426a9274d1'
            '66141323d6de100d9a1805f614a950944e223a36026b62b1a823c8aa148f26df'
            '8a68ecbd383f9121e54bd32f6094b2793367c15d8960ea5f92691e5b9bbcad99'
            '5863314f2ff17c32bc340efd5241f809bc1372b8e2fde0b3a2e22c7ab9b64281'
            '5de02253442ef8cb3b6f744fa4dd3237b66d96911ab8badd63336a7e1d28a429'
            'deb3e52e5406419cc42d15f1a668ed291ef8337217bb5bc9cefd01ef3b804371'
            )
sha256sums_i686=('1a61f3e0099aa962d07303555cfdb1265b2dd83348d3e1b3f1d6c36d53babd36')
sha256sums_x86_64=('63f0d87feba33a7602cdd7488317519edc33442037e1bbaef9f55ce9bd5ea3dd')
install=lsi-msm.install
backup=('etc/lsi_mrdsnmp/LSI_StorSNMP.ini'
        'etc/lsi_mrdsnmp/sas/sas_TrapDestination.conf'
        'etc/lsi_mrdsnmp/sas-ir/sas_ir_TrapDestination.conf'
        'usr/share/MegaRAID_Storage_Manager/StrongSSLEncryption.ini'
        'usr/share/MegaRAID_Storage_Manager/installationmode.properties'
        'usr/share/MegaRAID_Storage_Manager/vivaldikey.properties'
        'usr/share/MegaRAID_Storage_Manager/vivaldikeys'
        'usr/share/MegaRAID_Storage_Manager/vivaldikeys2048'
        'usr/share/MegaRAID_Storage_Manager/Framework/vivaldikey.properties'
        'usr/share/MegaRAID_Storage_Manager/Framework/vivaldikeys'
        'usr/share/MegaRAID_Storage_Manager/Framework/vivaldikeys2048'
        'usr/share/MegaRAID_Storage_Manager/MegaPopup/vivaldikey.properties'
        'usr/share/MegaRAID_Storage_Manager/MegaPopup/vivaldikeys'
        'usr/share/MegaRAID_Storage_Manager/MegaPopup/vivaldikeys2048'
        )
options=('!strip')

_create_links() {
  # create soname links
  for _lib in $(find "${pkgdir}/usr/lib" -name '*.so*' && \
                find "${pkgdir}/opt/lsi/Pegasus" -name '*.so*' && \
                find "${pkgdir}/opt/lsi/msm/lib" -name '*.so*' && \
                find "${pkgdir}/opt/lsi/snmp/lib" -name '*.so*'); do
    _soname=$(dirname "${_lib}")/$(readelf -d "${_lib}" | grep -Po 'SONAME.*: \[\K[^]]*' || true)
    _base=$(echo ${_soname} | sed -r 's/(.*).so.*/\1.so/')
    [[ -e "${_soname}" ]] || ln -s $(basename "${_lib}") "${_soname}"
    [[ -e "${_base}" ]] || ln -s $(basename "${_soname}") "${_base}"
  done
}

prepare() {
  # Patch pegasus-toc sources
  cd pegasus
  patch -p1 -i "${srcdir}/pegasus-2.7.0-PIE.patch"
  patch -p1 -i "${srcdir}/pegasus-2.9.0-no-rpath.patch"
  patch -p1 -i "${srcdir}/pegasus-2.13.0-gcc5-build.patch"
  patch -p1 -i "${srcdir}/pegasus-2.14.1-build-fixes.patch"
  patch -p1 -i "${srcdir}/pegasus-2.14.1-ssl-include.patch"
  patch -p1 -i "${srcdir}/pegasus-2.14.1-openssl-1.1-fix.patch"

  sed 's|libbase=lib64|libbase=lib|g' -i configure
}

build() {
  msg2 "Build Pegasus-TOG framework"
  cd pegasus
  ./configure
  make -f GNUmakefile
}

package() {
  cd "${pkgdir}"

  # Extract RPM's
  for i in $(find "${srcdir}/disk" -type f -name '*.rpm'); do bsdtar -xf "${i}"; done &> /dev/null

  # Move to correct place
  [ "${CARCH}" = "x86_64" ] && mv usr/lib64 usr/lib
  mv usr/local usr/share
  mv "usr/share/MegaRAID Storage Manager" usr/share/MegaRAID_Storage_Manager

  # setup shortcuts
  install -Dm644 usr/share/MegaRAID_Storage_Manager/setdisp.png usr/share/pixmaps/setdisp.png
  install -Dm644 usr/share/MegaRAID_Storage_Manager/MSMHelp.desktop.SuSE usr/share/applications/MSMHelp.desktop
  install -Dm644 usr/share/MegaRAID_Storage_Manager/MSMStartupUI.desktop.SuSE usr/share/applications/MSMStartupUI.desktop

  # setup installation properties
  echo INSTALLATION_MODE=0 > usr/share/MegaRAID_Storage_Manager/installationmode.properties

  # Set correct path in desktop launchers and fix entries
  sed -e 's|local/MegaRAID Storage Manager|share/MegaRAID_Storage_Manager|g' \
      -e 's|SystemSetup||g' \
      -i usr/share/applications/*.desktop
  sed '/SubstituteUID/d' -i usr/share/applications/MSMHelp.desktop

  # Fix permisions
  find . -type d -not \( -path */jre/* -prune \) -print0 2>/dev/null | xargs -0r chmod 755
  find . -type f -not \( -path */jre/* -prune \) -print0 2>/dev/null | xargs -0r chmod 644
  for i in $(find . -type f -not \( -path */jre/* -prune \) -name '*.sh' -o -name 'popup_bin' -o -name 'popup' -o -name "add_entry" -o -name 'storcli*' -o -name 'mrmonitor' -o -name '*.so*'); do chmod +x ${i}; done
  chmod +x etc/lsi_mrdsnmp/lsi_mrdsnmp{agent,main}

  # Make symlinks
  install -d usr/bin
  ln -sf /etc/lsi_mrdsnmp/lsi_mrdsnmpagent usr/bin/lsi_mrdsnmpagent
  ln -sf /etc/lsi_mrdsnmp/lsi_mrdsnmpmain usr/bin/lsi_mrdsnmpmain

  # Remove RH/SuSe paths remains
  for i in $(find . -type f -name '*.sh' -o -name 'popup'); do sed -e '/msm_profile/d' -i "${i}"; done

  # Standarized /usr/share/MegaRAID_Storage_Manager/start{,monitor}help.sh whit xdg-open ## Someday, I'll create a patch instead sed
  sed -e '13,20d' -e 's|mozilla|xdg-open|g' -e 's|/firefox||g' -i usr/share/MegaRAID_Storage_Manager/startmonitorhelp.sh
  sed -e '28,35d' -e 's|mozilla|xdg-open|g' -e 's|/firefox||g' -i usr/share/MegaRAID_Storage_Manager/starthelp.sh

  # Remove unused path in usr/share/MegaRAID_Storage_Manager/Framework/startup.sh
  sed -e 's|:/opt/lsi/Apache||g' -e 's|:/opt/lsi/openssl||g' -i usr/share/MegaRAID_Storage_Manager/Framework/startup.sh

  # Add missing #! in scripts
  sed '1i#!/usr/bin/sh' -i usr/share/MegaRAID_Storage_Manager/startupui.sh \
                        -i usr/share/MegaRAID_Storage_Manager/startmonitorhelp.sh \
                        -i usr/share/MegaRAID_Storage_Manager/Framework/startup.sh \
                        -i usr/share/MegaRAID_Storage_Manager/Framework/shutdown.sh

  # Install services and other files
  install -Dm644 "${srcdir}/lsi_msm.service" usr/lib/systemd/system/lsi_msm.service
  install -Dm644 "${srcdir}/lsi_mrdsnmpd.service" usr/lib/systemd/system/lsi_mrdsnmpd.service

  install -Dm755 "${srcdir}/msm_profile.sh" etc/profile.d/msm.sh

  install -Dm644 "${srcdir}/LSI_StorSNMP.ini"  etc/lsi_mrdsnmp/LSI_StorSNMP.ini

  # Remove unused files
  find . -name '*.log' -delete
  rm -fr etc/init.d \
         etc/lsi_mrdsnmp/lsi_mrdsnmpd.{rh,suse} \
         etc/lsi_mrdsnmp/sas{,-ir}/{install,uninstall} \
         usr/share/MegaRAID_Storage_Manager/*desktop.{SuSE,redhat} \
         usr/share/MegaRAID_Storage_Manager/{uninstaller,pwd,.__uninst}.sh \
         usr/share/MegaRAID_Storage_Manager/vmware{35,40}

  # Instal compiled Pegasus framework libraries
  rm -fr opt/lsi/Pegasus
  local _pegasus_lib=('libpegclient.so.1'
                      'libpegcommon.so.1'
                      'libpegconfig.so.1'
                      'libpegcql.so.1'
                      'libpegexportserver.so.1'
                      'libpeglistener.so.1'
                      'libpegprovider.so.1'
                      'libpegslp_client.so.1'
                      'libpegquerycommon.so.1'
                      'libpegqueryexpression.so.1'
                      'libpegwql.so.1'
                     )
  for i in ${_pegasus_lib[@]}; do install -Dm755 "${srcdir}/pegasus/lib/${i}" "opt/lsi/Pegasus/${i}"; done

  # Create soname links
  _create_links

  # Add /opt/lsi/msm/lib, /opt/lsi/Pegasus and /opt/lsi/snmp/lib to ldconf search path
  install -Dm644 "${srcdir}/ld.so.lsi-msm.conf" etc/ld.so.conf.d/lsi.conf

  # Remove Megapopup system launcher. because eats tons of RAM
  rm -fr etc/X11

  # Install licenses
  install -Dm644 "${srcdir}/SLA_AdvancedSoftware.pdf" "usr/share/licenses/${pkgname}/SLA_AdvancedSoftware.pdf"
  install -Dm644 "${srcdir}/pegasus/OpenPegasusNOTICE.txt" "usr/share/licenses/${pkgname}/OpenPegasusNOTICE.txt"
}
