# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lingua-en-inflect-number'
pkgver='1.12'
pkgrel='1'
pkgdesc="Perl/CPAN Module Lingua::EN::Inflect::Number: Force number of words to singular or plural"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-lingua-en-inflect')
makedepends=()
url='https://metacpan.org/release/Lingua-EN-Inflect-Number'
source=("http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Lingua-EN-Inflect-Number-${pkgver}.tar.gz")
md5sums=('b9dc7eb63ee1ff4877afc66440cea653')
sha512sums=('302c2f891984a7a0b10caa101d06524edc5343a5226ccd32952076e765d434d0ba26ced32d000f85ef01b3cff4510c1456003e222df59a084932e6934947ee08')
_distdir="Lingua-EN-Inflect-Number-${pkgver}"

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
