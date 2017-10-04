# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lingua-en-findnumber'
pkgver='1.32'
pkgrel='2'
pkgdesc="Perl/CPAN Module Lingua::EN::FindNumber: Locate (written) numbers in English text"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-lingua-en-words2nums>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Lingua-EN-FindNumber'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Lingua-EN-FindNumber-1.32.tar.gz')
md5sums=('edc9b091b4b97b8b3d37984ff50959d5')
sha512sums=('2e1ea42ebeb60d4be4a54bdb3b379cfb4949720f7e2c0dd6243d16908843c2daf1abd638675aea2a6d804a5b59facfeceaea39e580e67214b89ee1a061d7a330')
_distdir="Lingua-EN-FindNumber-1.32"

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
