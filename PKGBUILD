# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lingua-en-words2nums'
pkgver='0.18'
pkgrel='2'
pkgdesc="Perl/CPAN Module Lingua::EN::Words2Nums: Convert English text to numbers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Lingua-EN-Words2Nums'
source=('http://search.cpan.org/CPAN/authors/id/J/JO/JOEY/Lingua-EN-Words2Nums-0.18.tar.gz')
md5sums=('088e398a5f98ec6e3dc41a43babaf389')
sha512sums=('c26cc004f4df5d7a2b17e240c9e08dcc45f9da02d7c8488da98757ce38d29e78022c09b8f5ecb8b93219b9b36d13de0af965e86c0559a3d4dc5ad268dcaa2e76')
_distdir="Lingua-EN-Words2Nums-0.18"

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
