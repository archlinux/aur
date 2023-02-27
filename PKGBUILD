# Maintainer: Kars Wang <jaklsy AT gmail.com>
# Maintainer: camb

pkgname='perl-dancer2'
pkgver=0.400001
pkgrel=1
pkgdesc='Lightweight yet powerful web application framework'
_dist='Dancer2'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.12.5' 'perl-cli-osprey>=0' 'perl-mime-base64>=3.13' 'perl-module-runtime>=0' 'perl-import-into>=0' 'perl-plack>=1.0029' 'perl-exporter>=5.57' 'perl-data-dumper>=0' 'perl-plack-middleware-removeredundantbody>=0' 'perl-try-tiny>=0' 'perl-carp>=0' 'perl-hash-merge-simple>=0' 'perl-moox-types-mooselike>=0' 'perl-template-toolkit>=0' 'perl-http-tiny>=0' 'perl-yaml>=0.86' 'perl-pod-simple>=0' 'perl-app-cmd>=0' 'perl-file-path>=0' 'perl-file-share>=0' 'perl-plack-middleware-fixmissingbodyinredirect>=0' 'perl-safe-isa>=0' 'perl-uri>=0' 'perl-file-temp>=0.22' 'perl-json>=0' 'perl-moox-types-mooselike>=0.16' 'perl-test-simple>=0.92' 'perl-moo>=1.003000' 'perl-encode>=0' 'perl-http-date>=0' 'perl-pathtools>=0' 'perl-ref-util>=0' 'perl-template-tiny>=0' 'perl-type-tiny>=1.000006' 'perl-scalar-list-utils>=0' 'perl-return-multilevel>=0' 'perl-io>=0' 'perl-http-body>=0' 'perl-role-tiny>=1.003000' 'perl-class-load>=0' 'perl-digest-sha>=0' 'perl-file-sharedir>=0' 'perl-http-headers-fast>=0' 'perl-safe>=0' 'perl-config-any>=0' 'perl-file-which')
checkdepends=('perl>=5.12.5' 'perl-test-simple>=0.92' 'perl-test-fatal>=0' 'perl-file-temp>=0.22' 'perl-http-body>=0' 'perl-yaml>=0.86' 'perl-extutils-makemaker>=0' 'perl-http-message>=0' 'perl-test-eol>=0' 'perl-capture-tiny>=0.12' 'perl-pathtools>=0' 'perl-http-cookies>=0')
makedepends=('perl-test-cpan-meta>=0')
provides=("perl-dancer2-cli=${pkgver}" "perl-dancer2-cli-command-gen=${pkgver}" "perl-dancer2-cli-command-version=${pkgver}" "perl-dancer2-core=${pkgver}" "perl-dancer2-core-app=${pkgver}" "perl-dancer2-core-cookie=${pkgver}" "perl-dancer2-core-dsl=${pkgver}" "perl-dancer2-core-dispatcher=${pkgver}" "perl-dancer2-core-error=${pkgver}" "perl-dancer2-core-factory=${pkgver}" "perl-dancer2-core-http=${pkgver}" "perl-dancer2-core-hook=${pkgver}" "perl-dancer2-core-mime=${pkgver}" "perl-dancer2-core-request=${pkgver}" "perl-dancer2-core-request-upload=${pkgver}" "perl-dancer2-core-response=${pkgver}" "perl-dancer2-core-response-delayed=${pkgver}" "perl-dancer2-core-role-configreader=${pkgver}" "perl-dancer2-core-role-dsl=${pkgver}" "perl-dancer2-core-role-engine=${pkgver}" "perl-dancer2-core-role-handler=${pkgver}" "perl-dancer2-core-role-haslocation=${pkgver}" "perl-dancer2-core-role-headers=${pkgver}" "perl-dancer2-core-role-hookable=${pkgver}" "perl-dancer2-core-role-logger=${pkgver}" "perl-dancer2-core-role-response=${pkgver}" "perl-dancer2-core-role-serializer=${pkgver}" "perl-dancer2-core-role-sessionfactory=${pkgver}" "perl-dancer2-core-role-sessionfactory-file=${pkgver}" "perl-dancer2-core-role-standardresponses=${pkgver}" "perl-dancer2-core-role-template=${pkgver}" "perl-dancer2-core-route=${pkgver}" "perl-dancer2-core-runner=${pkgver}" "perl-dancer2-core-session=${pkgver}" "perl-dancer2-core-time=${pkgver}" "perl-dancer2-core-types=${pkgver}" "perl-dancer2-fileutils=${pkgver}" "perl-dancer2-handler-autopage=${pkgver}" "perl-dancer2-handler-file=${pkgver}" "perl-dancer2-logger-capture=${pkgver}" "perl-dancer2-logger-capture-trap=${pkgver}" "perl-dancer2-logger-console=${pkgver}" "perl-dancer2-logger-diag=${pkgver}" "perl-dancer2-logger-file=${pkgver}" "perl-dancer2-logger-note=${pkgver}" "perl-dancer2-logger-null=${pkgver}" "perl-dancer2-plugin=${pkgver}" "perl-dancer2-serializer-dumper=${pkgver}" "perl-dancer2-serializer-json=${pkgver}" "perl-dancer2-serializer-mutable=${pkgver}" "perl-dancer2-serializer-yaml=${pkgver}" "perl-dancer2-session-simple=${pkgver}" "perl-dancer2-session-yaml=${pkgver}" "perl-dancer2-template-implementation-forkedtiny=${pkgver}" "perl-dancer2-template-simple=${pkgver}" "perl-dancer2-template-templatetoolkit=${pkgver}" "perl-dancer2-template-tiny=${pkgver}" "perl-dancer2-test=${pkgver}")
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/C/CR/CROMEDOME/${_dist}-${pkgver}.tar.gz")
md5sums=('28739dbe3a4fed12349385407bccc3ce')
sha256sums=('9db575bc50413fc19399569ad2cfbc52fb49ed7115d03194a908d9989304b74c')
sha512sums=('d27b4fe004bc21ee2a2c4d73638d158970f524370f453d3d8a23e2a2ccb1305d346f27085e015db87c985e6df22911d4add26c7627bf87208141181104dbfdf0')

build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
