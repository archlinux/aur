# Maintainer: int <int [ate] arcor [dot] de>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lingua-en-tagger'
pkgver='0.31'
pkgrel='1'
pkgdesc="Perl/CPAN Module Lingua::EN::Tagger: Part-of-speech tagger for English natural language processing."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser' 'perl-html-tagset' 'perl-lingua-stem' 'perl-memoize-expirelru' 'perl')
makedepends=()
url='https://metacpan.org/release/Lingua-EN-Tagger'
source=("https://search.cpan.org/CPAN/authors/id/A/AC/ACOBURN/Lingua-EN-Tagger-${pkgver}.tar.gz")
sha512sums=('396b96d9160185bf557b6caa3985153cea18fb05c82d295c7915424305b6ebe9a1a02091b9d32db3b83104d571e8eb8a31a58d35ea3ee960937230ac2b416e0d')
md5sums=('2046184b9b33ec5ae4b090b0941e8986')
_distdir="Lingua-EN-Tagger-${pkgver}"

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
