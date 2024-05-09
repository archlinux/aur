# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lingua-pt-stemmer'
pkgver='0.02'
pkgrel='1'
pkgdesc="Perl/CPAN Module Lingua::PT::Stemmer: Portuguese language stemming"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://search.cpan.org/dist/Lingua-PT-Stemmer'
source=("https://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Lingua-PT-Stemmer-${pkgver}.tar.gz")
sha512sums=('3537d947b9deeab15376502beb5540fe6afdabc1cd5fd18ec399d12f4dc715def15eb5c9cb052eb5be4b3c03731fd0f0d25ef84bec797f38c3e0f0785c4859b5')
md5sums=('4ad757419b29bc326fde1529af5ed7b9')
_distdir="Lingua-PT-Stemmer-${pkgver}"

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
