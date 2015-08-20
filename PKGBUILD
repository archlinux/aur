# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-dancer2'
pkgver=0.161000
pkgrel=1
pkgdesc='Lightweight yet powerful web application framework'
_dist='Dancer2'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl>=5.6' 'perl-mime-base64>=3.13' 'perl-module-runtime>=0' 'perl-import-into>=0' 'perl-plack>=1.0029' 'perl-exporter>=5.57' 'perl-data-dumper>=0' 'perl-plack-middleware-removeredundantbody>=0' 'perl-try-tiny>=0' 'perl-carp>=0' 'perl-hash-merge-simple>=0' 'perl-moox-types-mooselike>=0' 'perl-template-toolkit>=0' 'perl-http-tiny>=0' 'perl-yaml>=0.86' 'perl-pod-simple>=0' 'perl-app-cmd>=0' 'perl-file-path>=0' 'perl-plack-middleware-fixmissingbodyinredirect>=0' 'perl-safe-isa>=0' 'perl-uri>=0' 'perl-file-temp>=0.22' 'perl-json>=0' 'perl-moox-types-mooselike>=0.16' 'perl-test-simple>=0.92' 'perl-moo>=1.003000' 'perl-encode>=0' 'perl-http-date>=0' 'perl-pathtools>=0' 'perl-template-tiny>=0' 'perl-scalar-list-utils>=0' 'perl-return-multilevel>=0' 'perl-io>=0' 'perl-http-body>=0' 'perl-role-tiny>=1.003000' 'perl-class-load>=0' 'perl-digest-sha>=0' 'perl-file-sharedir>=0' 'perl-http-headers-fast>=0' 'perl-safe>=0' 'perl-config-any>=0')
checkdepends=('perl>=5.6' 'perl-io>=0' 'perl-test-simple>=0.92' 'perl-test-fatal>=0' 'perl-file-temp>=0.22' 'perl-http-body>=0' 'perl-yaml>=0.86' 'perl-extutils-makemaker>=0' 'perl-http-message>=0' 'perl-capture-tiny>=0.12' 'perl-pathtools>=0' 'perl-http-cookies>=0')
makedepends=()
provides=('perl-dancer2-cli=0.161000' 'perl-dancer2-cli-command-gen=0.161000' 'perl-dancer2-cli-command-version=0.161000' 'perl-dancer2-core=0.161000' 'perl-dancer2-core-app=0.161000' 'perl-dancer2-core-cookie=0.161000' 'perl-dancer2-core-dsl=0.161000' 'perl-dancer2-core-dispatcher=0.161000' 'perl-dancer2-core-error=0.161000' 'perl-dancer2-core-factory=0.161000' 'perl-dancer2-core-http=0.161000' 'perl-dancer2-core-hook=0.161000' 'perl-dancer2-core-mime=0.161000' 'perl-dancer2-core-request=0.161000' 'perl-dancer2-core-request-upload=0.161000' 'perl-dancer2-core-response=0.161000' 'perl-dancer2-core-response-delayed=0.161000' 'perl-dancer2-core-role-configreader=0.161000' 'perl-dancer2-core-role-dsl=0.161000' 'perl-dancer2-core-role-engine=0.161000' 'perl-dancer2-core-role-handler=0.161000' 'perl-dancer2-core-role-haslocation=0.161000' 'perl-dancer2-core-role-headers=0.161000' 'perl-dancer2-core-role-hookable=0.161000' 'perl-dancer2-core-role-logger=0.161000' 'perl-dancer2-core-role-response=0.161000' 'perl-dancer2-core-role-serializer=0.161000' 'perl-dancer2-core-role-sessionfactory=0.161000' 'perl-dancer2-core-role-sessionfactory-file=0.161000' 'perl-dancer2-core-role-standardresponses=0.161000' 'perl-dancer2-core-role-template=0.161000' 'perl-dancer2-core-route=0.161000' 'perl-dancer2-core-runner=0.161000' 'perl-dancer2-core-session=0.161000' 'perl-dancer2-core-time=0.161000' 'perl-dancer2-core-types=0.161000' 'perl-dancer2-fileutils=0.161000' 'perl-dancer2-handler-autopage=0.161000' 'perl-dancer2-handler-file=0.161000' 'perl-dancer2-logger-capture=0.161000' 'perl-dancer2-logger-capture-trap=0.161000' 'perl-dancer2-logger-console=0.161000' 'perl-dancer2-logger-diag=0.161000' 'perl-dancer2-logger-file=0.161000' 'perl-dancer2-logger-note=0.161000' 'perl-dancer2-logger-null=0.161000' 'perl-dancer2-plugin=0.161000' 'perl-dancer2-serializer-dumper=0.161000' 'perl-dancer2-serializer-json=0.161000' 'perl-dancer2-serializer-mutable=0.161000' 'perl-dancer2-serializer-yaml=0.161000' 'perl-dancer2-session-simple=0.161000' 'perl-dancer2-session-yaml=0.161000' 'perl-dancer2-template-implementation-forkedtiny=0.161000' 'perl-dancer2-template-simple=0.161000' 'perl-dancer2-template-templatetoolkit=0.161000' 'perl-dancer2-template-tiny=0.161000' 'perl-dancer2-test=0.161000')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/X/XS/XSAWYERX/$_dist-$pkgver.tar.gz")
sha256sums=('1ac2f11604684a2390dbf7be41504e2e4508e49bdb730b012bd6d7be0d04cef8')

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
