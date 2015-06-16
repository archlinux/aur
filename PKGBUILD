# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-test-tempdir'
pkgver='0.08'
pkgrel='1'
pkgdesc="Temporary files support for testing."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-nfslock' 'perl-moose' 'perl-moosex-types-path-class' 'perl-path-class' 'perl-sub-exporter' 'perl-test-checkdeps>=0.007' 'perl-test-requires' 'perl-test-use-ok' 'perl-namespace-autoclean>=0.08' 'perl-directory-scratch')
makedepends=()
url='http://search.mcpan.org/dist/Test-TempDir'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Test-TempDir-0.08.tar.gz')
md5sums=('81542818c02d82caecfdfe14ccb4d281')
sha512sums=('83bd17bfccb7ff4b7e1a52246852948175a7ea3d03d35e37237da6ba4e28239b2d2ecb157774d80778921606d283ca73069d642424abcd482bfba6a11b0de711')
_distdir="Test-TempDir-0.08"

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
  # Make test fails due to CORE module: CPAN::Meta::Prereqs version too low.
  # Skipping make test until core/perl next upgrade
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
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
