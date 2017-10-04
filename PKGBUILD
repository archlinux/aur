# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-biblio-endnotestyle'
pkgver='0.06'
pkgrel='2'
pkgdesc="Perl/CPAN Module Biblio::EndnoteStyle: reference formatting using Endnote-like templates"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Biblio-EndnoteStyle'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIRK/Biblio-EndnoteStyle-0.06.tar.gz')
md5sums=('4dcf3c92ff449b5413f53fcebf19284c')
sha512sums=('acbf906b06b3a9550268561641583868f2fbda63dabc882b2c38f7aeb5df829a494ebd84b4044f322d0bda1a938136b792337c537e3ff9099fb750cdf91e02b4')
_distdir="Biblio-EndnoteStyle-0.06"

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
