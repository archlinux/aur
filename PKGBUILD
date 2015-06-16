# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lingua-stem'
pkgver='0.84'
pkgrel='1'
pkgdesc="Stemming of words in various languages"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-lingua-pt-stemmer' 'perl-lingua-stem-fr>=0.02' 'perl-lingua-stem-it' 'perl-lingua-stem-ru' 'perl-lingua-stem-snowball-da>=1.01' 'perl-snowball-norwegian' 'perl-snowball-swedish' 'perl-text-german')
makedepends=()
url='http://search.cpan.org/dist/Lingua-Stem'
source=('http://search.cpan.org/CPAN/authors/id/S/SN/SNOWHARE/Lingua-Stem-0.84.tar.gz')
md5sums=('a236b5d85ac49f84aad447c1383ad2de')
sha512sums=('9806ef6bf9df8f71fa2c7500f5575560f7be733c8e859a34cfedf8eadb7333d549d76989313dc14b6760f79c0ca0e0f61fe69819ee04cedc5d3b58414ce06388')
_distdir="Lingua-Stem-0.84"

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
