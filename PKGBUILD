# Maintainer: robertfoster
# Missing PERL deps (at least for now)
# perl-geography-countries
# perl-socket-linux
# perl-unix-getrusage
# perl-ipc-cmd
# perl-io-sessiondata
# perl-mail-spamassassin
# perl-swatchdog
# perl-unix-syslog
# perl-crypt-saltedhash
# perl-db-file
# perl-xml-parser-lite

pkgname=zimbra
pkgbase=zimbra
pkgver=9.0.0.p10
pkgrel=1
pkgdesc="An enterprise-class email calendar and collaboration solution built for the cloud both public and private"
arch=(x86_64)
url="https://www.zimbra.com/open-source-email-overview/"
license=(CPAL)
depends=(
  'java-runtime>=11' 'perl-archive-zip' 'perl-berkeleydb' 'perl-bit-vector' 'perl-cache-fastmmap' 'perl-canary-stability' 'perl-carp-clan'
  'perl-class-inspector' 'perl-compress-raw-bzip2' 'perl-compress-raw-zlib' 'perl-config-inifiles' 'perl-convert-asn1' 'perl-convert-binhex'
  'perl-convert-tnef' 'perl-convert-uulib' 'perl-crypt-openssl-random' 'perl-crypt-openssl-rsa' 'perl-data-uuid'
  'perl-date-calc' 'perl-date-manip' 'perl-dbd-mysql' 'perl-dbd-sqlite' 'perl-dbi' 'perl-digest-hmac' 'perl-digest-sha1'
  'perl-email-date-format' 'perl-encode-detect' 'perl-encode-locale' 'perl-error' 'perl-exporter-tiny' 'perl-extutils-constant' 'perl-file-grep'
  'perl-file-libmagic' 'perl-file-listing' 'perl-file-tail' 'perl-filesys-df' 'perl-html-parser' 'perl-http-cookies'
  'perl-http-daemon' 'perl-http-date' 'perl-http-message' 'perl-http-negotiate' 'perl-io-compress' 'perl-io-html' 'perl-io-multiplex' 'perl-ldap' 'perl-list-moreutils-xs'
  'perl-io-socket-inet6' 'perl-io-socket-ip' 'perl-io-socket-ssl' 'perl-io-stringy' 'perl-ip-country' 'perl-json-pp' 'perl-libwww' 'perl-list-moreutils'
  'perl-lwp-mediatypes' 'perl-lwp-protocol-https' 'perl-mail-dkim' 'perl-mail-spf' 'perl-mailtools' 'perl-math-bigint'
  'perl-mime-lite' 'perl-mime-tools' 'perl-mime-types' 'perl-mozilla-ca' 'perl-net-cidr' 'perl-net-cidr-lite' 'perl-net-dns' 'perl-net-dns-resolver-programmable'
  'perl-net-http' 'perl-net-ldapapi' 'perl-net-libidn' 'perl-net-server' 'perl-net-ssleay' 'perl-netaddr-ip' 'perl-parent' 'perl-proc-processtable'
  'perl-soap-lite' 'perl-socket' 'perl-socket6' 'perl-storable' 'perl-task-weaken' 'perl-term-readkey' 'perl-timedate'
  'perl-unix-syslog' 'perl-uri' 'perl-xml-parser' 'perl-xml-sax' 'perl-xml-sax-base' 'perl-xml-sax-expat')
optdepends=('innotop')
makedepends=('maven' 'ant' 'java-hamcrest' 'jdk8-openjdk' 'junit' 'lsb-release' 'perl-devel-checklib' 'rsync' 'ruby')
install=

# Zimbra Configuration Variables
_buildtype="FOSS"
_major=$(echo "${pkgver}" | cut -d'.' -f1)
_micro=$(echo "${pkgver}" | cut -d'.' -f3)
_minor=$(echo "${pkgver}" | cut -d'.' -f2)
_os="ARCH"
_ostag="arch"
_rc="GA"
_release="KEPLER"
_releaseno="${pkgver%.*}"
_timestamp=$(date +'%Y%m%d')

source=("git+https://github.com/Zimbra/zm-build#tag=${_releaseno}" # Repo list is synced with instructions/FOSS_repo_list.pl
  "git+https://github.com/M0Rf30/zimbra-package-stub"              # A fork of mine to detect Arch
  "git+https://github.com/Zimbra/ant-1.7.0-ziputil-patched#tag=${_releaseno}"
  "git+https://github.com/Zimbra/ant-tar-patched#tag=${_releaseno}"
  "git+https://github.com/Zimbra/ical4j-0.9.16-patched#tag=${_releaseno}"
  "git+https://github.com/kohlschutter/junixsocket#tag=junixsocket-parent-2.0.4"
  "git+https://github.com/Zimbra/nekohtml-1.9.13#tag=${_releaseno}"
  "git+https://github.com/Zimbra/java-html-sanitizer-release-20190610.1#tag=${_releaseno}"
  "git+https://github.com/Zimbra/antisamy#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-admin-console#tag=${_releaseno}.p9"
  "git+https://github.com/Zimbra/zm-admin-help-common#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-ajax#tag=${_releaseno}.p9"
  "git+https://github.com/Zimbra/zm-admin-ajax#tag=${_releaseno}.p8"
  "git+https://github.com/Zimbra/zm-amavis#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-aspell#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-bulkprovision-admin-zimlet#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-bulkprovision-store#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-certificate-manager-admin-zimlet#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-certificate-manager-store#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-charset#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-clam-scanner-store#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-clientuploader-admin-zimlet#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-clientuploader-store#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-core-utils#tag=${_releaseno}.p9"
  "git+https://github.com/Zimbra/zm-db-conf#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-dnscache#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-downloads#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-freshclam#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-help#tag=${_releaseno}.p9"
  "git+https://github.com/Zimbra/zm-helptooltip-zimlet#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-jetty-conf#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-jython#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-launcher#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-ldap-utilities#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-ldap-utils-store#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-licenses#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-mailbox#tag=${_releaseno}.p10"
  "git+https://github.com/Zimbra/zm-migration-tools#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-mta#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-nginx-conf#tag=${_releaseno}.p9"
  "git+https://github.com/Zimbra/zm-nginx-lookup-store#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-openid-consumer-store#tag=${_releaseno}"
  "git+https://github.com/M0Rf30/zm-pkg-tool#tag=${_releaseno}.arch.p7" # A fork of mine to support Arch
  "git+https://github.com/Zimbra/zm-postfix#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-proxy-config-admin-zimlet#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-ssdb-ephemeral-store#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-taglib#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-timezones#tag=${_releaseno}.p9"
  "git+https://github.com/Zimbra/zm-versioncheck-admin-zimlet#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-versioncheck-store#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-versioncheck-utilities#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-viewmail-admin-zimlet#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-web-client#tag=${_releaseno}.p10"
  "git+https://github.com/Zimbra/zm-webclient-portal-example#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-zcs#tag=${_releaseno}"
  "git+https://github.com/Zimbra/zm-zcs-lib#tag=${_releaseno}.p4"
  "git+https://github.com/Zimbra/zm-zimlets#tag=${_releaseno}.p9"
  "git+https://github.com/Zimbra/zm-oauth-social#tag=${_releaseno}.p7"
  "git+https://github.com/Zimbra/zm-gql#tag=${_releaseno}"
  "zimbra.sysusers"
  "zimbra.tmpfiles"
  "localconfig.xml"
  "arch-patch.diff"
)
noextract=()

prepare() {
  cd "$srcdir"

  # Bypass build.pl git checkout
  sed -i 's/Checkout($all_repos)/#Checkout($all_repos)/g' \
    zm-build/build.pl
  # Add support for Arch in some scripts
  patch -Np0 -i arch-patch.diff
}

build() {
  cd "$srcdir/zm-build"

  # Set JDK 8 as runtime
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
  export JAVA_PATH=/usr/lib/jvm/java-8-openjdk/bin

  # Let's build for real now
  ./build.pl -build-no=$pkgrel --build-ts=${_timestamp} \
    --build-release=${_release} --build-release-no=${_releaseno} \
    --build-os=${_os} --build-release-candidate=${_rc} --build-type=${_buildtype} \
    --build-arch=$CARCH --pkg-os-tag=${_ostag} \
    --build-thirdparty-server=files.zimbra.com --no-interactive \
    --build-prod-flag --disable-bundle --ant-options="-DskipTests=1"
}

package() {
  cd "$srcdir"
  cd .staging/${_os}-${_release}-${_major}${_minor}${_micro}-${_timestamp}-${_buildtype}-${pkgrel}
  find . -type d -name "opt" -exec rsync -av {} "$pkgdir" \;
  find . -type d -name "opt" | xargs rm -rf
  find . -type d -name "etc" -exec rsync -av {} "$pkgdir" \;
  find . -type d -name "etc" | xargs rm -rf
  rsync -av "$srcdir/zm-mailbox/build/stage/zimbra-common-core-jar/opt" "$pkgdir"
  chmod 750 -R $pkgdir/etc/sudoers.d
  chmod +x $pkgdir/opt/zimbra/bin/*

  # systemd
  #	install -D -m644 "${srcdir}/zimbra.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -D -m644 "${srcdir}/zimbra.sysusers" "${pkgdir}/usr/lib/sysusers.d/zimbra.conf"
  install -D -m644 "${srcdir}/zimbra.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/zimbra.conf"

  # Using a pregenerated localconfig.xml to set JRE
  install -D -m644 "${srcdir}/localconfig.xml" "${pkgdir}/opt/zimbra/conf/localconfig.xml"
}

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '21b3bdbcb2d23357104122df3de217b5'
         '84ad300287d602d4d6b2601748ddbaac'
         '9c97f489e0fa84a7be0a0dec593fd946'
         'a33b2181aa9bd50470192727bab7d3fa')
