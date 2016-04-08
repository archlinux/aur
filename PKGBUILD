# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-lingua-en-tagger'
pkgver='0.25'
pkgrel='1'
pkgdesc="Part-of-speech tagger for English natural language processing."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-html-parser>=3.45' 'perl-html-tagset>=3.20' 'perl-lingua-stem>=0.81' 'perl-memoize-expirelru>=0.55' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Lingua-EN-Tagger'
source=('http://search.cpan.org/CPAN/authors/id/A/AC/ACOBURN/Lingua-EN-Tagger-0.25.tar.gz')
md5sums=('c626a636bb3f33d56613eb65a926e600')
sha512sums=('a0237f34272a0a5efd07a38c6ba793ddf63c405cfbde5f6c2100260be735310e514ca2f8bc699d0634ba959a3a66f655f05d837eafc988089b1a661e1a26eb3a')
_distdir="Lingua-EN-Tagger-0.25"

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
