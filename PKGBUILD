# Maintainer : int <int [ate] arcor [dot] de>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sql-translator'
pkgver='1.66'
pkgrel='1'
pkgdesc="Perl/CPAN Module SQL::Translator: Manipulate structured data definitions (SQL and more)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-carp-clan>=0' 'perl-dbi>=1.54' 'perl-file-sharedir>=1.0' 'perl-json-maybexs>=1.003003' 'perl-moo>=1.000003' 'perl-package-variant>=1.001001' 'perl-parse-recdescent>=1.967009' 'perl-sub-quote>=0' 'perl-try-tiny>=0.04' 'perl-xml-writer>=0.500' 'perl-yaml>=0.66')
makedepends=()
checkdepends=('perl-test-differences' 'perl-test-exception>=0.42')
url='https://metacpan.org/release/SQL-Translator'
source=("http://search.cpan.org/CPAN/authors/id/V/VE/VEESH/SQL-Translator-$pkgver.tar.gz")
md5sums=('27d1d5879c58d2ce411a9e7ae43cd629')
sha512sums=('fb5002e60b0c0e974630d9839899eee69919c076009a54c63a5585f279eace1b5e4e58bee67fe6110136e7b19b023720fa88a53e613ccdd642467ae344f346bf')
_distdir="SQL-Translator-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
