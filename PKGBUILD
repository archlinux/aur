# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla'
pkgver='6.009'
pkgrel='1'
pkgdesc="distribution builder; installer not included!"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-app-cmd' 'perl-cpan-meta-check>=0.011' 'perl-cpan-uploader>=0.103004' 'perl-class-load>=0.17' 'perl-config-ini' 'perl-config-mvp' 'perl-config-mvp-reader-ini>=2.101461' 'perl-data-section>=0.200002' 'perl-datetime>=0.44' 'perl-file-copy-recursive' 'perl-file-find-rule' 'perl-file-homedir' 'perl-file-sharedir' 'perl-file-sharedir-install>=0.03' 'perl-file-pushd' 'perl-json-maybexs' 'perl-log-dispatchouli>=1.102220' 'perl-mixin-linewise' 'perl-module-runtime' 'perl-moose>=0.92' 'perl-moosex-lazyrequire' 'perl-moosex-role-parameterized>=1.01' 'perl-moosex-setonce' 'perl-moosex-types' 'perl-moosex-types-perl' 'perl-ppi' 'perl-params-util' 'perl-path-tiny>=0.052' 'perl-perl-prereqscanner>=1.016' 'perl-pod-eventual>=0.091480' 'perl-scalar-list-utils' 'perl-software-license>=0.101370' 'perl-string-formatter>=0.100680' 'perl-string-rewriteprefix>=0.006' 'perl-sub-exporter' 'perl-sub-exporter-formethods' 'perl-term-encoding' 'perl-term-ui' 'perl-term-readkey' 'perl-text-glob>=0.08' 'perl-text-template' 'perl-try-tiny' 'perl-yaml-tiny' 'perl-namespace-autoclean' 'perl>=5.14.0')
makedepends=()
checkdepends=('perl-test-deep' 'perl-test-failwarnings' 'perl-test-fatal' 'perl-test-file-sharedir')
url='https://metacpan.org/release/Dist-Zilla'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Dist-Zilla-6.009.tar.gz')
md5sums=('f7219dc8748f407c435a5bcab254a030')
sha512sums=('1bf33138838b8b718fdf0710c36d5106c29ff8dd775d10dc2aa96d3e628f3b889e3eb909cd5766f01709449b3f02e7f32b6222935a86ba7403eaa0d8d4071d9d')
_distdir="Dist-Zilla-6.009"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
