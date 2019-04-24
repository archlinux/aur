# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-pod-readme'
pkgver='1.2.3'
pkgrel='1'
pkgdesc="Intelligently generate a README file from POD"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-changes>=0.30' 'perl-class-method-modifiers>=0' 'perl-file-slurp>=0' 'perl-getopt-long-descriptive>=0' 'perl-io-string>=0' 'perl-moo>=0' 'perl-moox-handlesvia>=0' 'perl-path-tiny>=0' 'perl-role-tiny>=0' 'perl-try-tiny>=0' 'perl-type-tiny>=1.000000' 'perl-namespace-autoclean>=0' 'perl>=5.10.1')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-exception>=0' 'perl-test-kit>=0')
url='https://metacpan.org/release/Pod-Readme'
source=('http://search.cpan.org/CPAN/authors/id/R/RR/RRWO/Pod-Readme-v1.2.3.tar.gz')
md5sums=('116d264f9224db2dab10a40af1e984eb')
sha512sums=('c9518d3fd3082d6c4bb87300e04e29cb14459c08e3573bac6542ab4d4842389eaabb0d37fdc018ddb971e876b30078d14ce007840c867a7a81c0952c77c03a66')
_distdir="Pod-Readme-v1.2.3"

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
