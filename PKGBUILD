# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-wordnet-similarity'
pkgver='2.05'
pkgrel='1'
pkgdesc="WordNet-based measures of semantic relatedness."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-digest-sha1' 'perl-text-similarity>=0.02' 'perl-wordnet-querydata>=1.40')
makedepends=()
url='http://search.cpan.org/dist/WordNet-Similarity'
source=('http://search.cpan.org/CPAN/authors/id/T/TP/TPEDERSE/WordNet-Similarity-2.05.tar.gz')
md5sums=('d8aba9c3472e11beb0fc0f0f31911e47')
sha512sums=('7e8e1338b34fead131d7ce696e46a02e7d5e851644bdde8a0a4a7e8d0b1c38adc86e50e81abd29a0b958195e695b151871f40fb6cce7e7c404702ceabee3bf31')
_distdir="WordNet-Similarity-2.05"

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
