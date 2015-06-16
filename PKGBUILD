# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-perl-minimumversion'
pkgver='1.38'
pkgrel='1'
pkgdesc="Find a minimum required version of perl for Perl code"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-find-rule' 'perl-file-find-rule-perl' 'perl-ppi>=1.215' 'perl-ppix-regexp>=0.033' 'perl-params-util>=0.25' 'perl-critic' 'perl')
makedepends=()
checkdepends=('perl-test-script>=1.03')
url='http://search.mcpan.org/dist/Perl-MinimumVersion'
source=('http://search.mcpan.org/CPAN/authors/id/N/NE/NEILB/Perl-MinimumVersion-1.38.tar.gz')
md5sums=('4285a236c64b87d67f0afd14b167cde4')
sha512sums=('4a1b5a30c1b2c82ebdd5908b667d012376372890278fb3f1a08ead300b8ce02396f511df5250123689611ad5c0b0ad2b41a4c1ebe76c33109f2226eef95c9d4f')
_distdir="Perl-MinimumVersion-1.38"

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
