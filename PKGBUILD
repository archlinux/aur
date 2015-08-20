# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-pod-weaver'
pkgver=4.012
pkgrel=1
pkgdesc='weave together a Pod document from an outline'
_dist='Pod-Weaver'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' 'perl-namespace-autoclean>=0' 'perl-params-util>=0' 'perl-config-mvp>=2' 'perl-log-dispatchouli>=1.100710' 'perl-datetime>=0' 'perl-encode>=0' 'perl-moose>=0' 'perl-mixin-linewise>=0.103' 'perl-module-runtime>=0' 'perl-string-formatter>=0.100680' 'perl-list-moreutils>=0' 'perl-config-mvp-reader-ini>=0' 'perl-string-flogger>=1' 'perl-pod-elemental>=0.100220' 'perl-string-rewriteprefix>=0' 'perl-scalar-list-utils>=1.33')
provides=('perl-pod-weaver-config=4.011' 'perl-pod-weaver-config-assembler=4.011' 'perl-pod-weaver-config-finder=4.011' 'perl-pod-weaver-plugin-ensurepod5=4.011' 'perl-pod-weaver-plugin-h1nester=4.011' 'perl-pod-weaver-plugin-singleencoding=4.011' 'perl-pod-weaver-plugin-transformer=4.011' 'perl-pod-weaver-pluginbundle-coreprep=4.011' 'perl-pod-weaver-pluginbundle-default=4.011' 'perl-pod-weaver-role-dialect=4.011' 'perl-pod-weaver-role-finalizer=4.011' 'perl-pod-weaver-role-plugin=4.011' 'perl-pod-weaver-role-preparer=4.011' 'perl-pod-weaver-role-section=4.011' 'perl-pod-weaver-role-stringfromcomment=4.011' 'perl-pod-weaver-role-transformer=4.011' 'perl-pod-weaver-section-authors=4.011' 'perl-pod-weaver-section-bugs=4.011' 'perl-pod-weaver-section-collect=4.011' 'perl-pod-weaver-section-generic=4.011' 'perl-pod-weaver-section-leftovers=4.011' 'perl-pod-weaver-section-legal=4.011' 'perl-pod-weaver-section-name=4.011' 'perl-pod-weaver-section-region=4.011' 'perl-pod-weaver-section-version=4.011')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/$_dist-$pkgver.tar.gz")
sha256sums=('d801cbfaff22d418943d0c5dcb8c145b8cc4d56741f9c33923ef891241116ad6')

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
