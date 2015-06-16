# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-sql-translator'
pkgver='0.11020'
pkgrel='1'
pkgdesc="SQL DDL transformations and more"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-clan' 'perl-dbi>=1.54' 'perl-file-sharedir>=1.0' 'perl-list-moreutils>=0.09' 'perl-moo>=1.000003' 'perl-package-variant>=1.001001' 'perl-parse-recdescent>=1.967009' 'perl-try-tiny>=0.04' 'perl>=5.8.1')
makedepends=('perl-json>=2.0' 'perl-xml-writer>=0.500' 'perl-yaml>=0.66')
checkdepends=('perl-test-differences' 'perl-test-exception>=0.31')
url='http://search.mcpan.org/dist/SQL-Translator'
source=('http://search.mcpan.org/CPAN/authors/id/I/IL/ILMARI/SQL-Translator-0.11020.tar.gz')
md5sums=('271d40a2c484b41a8654f918be28695b')
sha512sums=('af044b6a5fca4935b119e0cec08b7ce0567a792d529cc9615708e0b87e052578f8697c9c036ea3f687fe2d9e9ac916a3b6d1585ede25104e7ca9caeab5940884')
_distdir="SQL-Translator-0.11020"

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
