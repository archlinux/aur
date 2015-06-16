# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-text-similarity'
pkgver='0.10'
pkgrel='1'
pkgdesc="Measure the pair-wise Similarity of Files or Strings"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Text-Similarity'
source=('http://search.cpan.org/CPAN/authors/id/T/TP/TPEDERSE/Text-Similarity-0.10.tar.gz')
md5sums=('33af64040b468436a8649609c4cc8857')
sha512sums=('0897be5805bd86595e34b5e7dae1dac78ffe4ca7aa2cf1fb0305333ee2c175bc175a82b2d667c640940729d4ce096d23f5d029f509ed14d1b9da54c8f4c5f596')
_distdir="Text-Similarity-0.10"

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
