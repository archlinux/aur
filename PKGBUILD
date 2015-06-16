# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lingua-en-tagger'
pkgver='0.24'
pkgrel='1'
pkgdesc="Part-of-speech tagger for English natural language processing."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1' 'perl-html-parser>=3.45' 'perl-html-tagset>=3.20' 'perl-lingua-stem>=0.81' 'perl-memoize-expirelru>=0.55')
makedepends=()
url='http://search.cpan.org/dist/Lingua-EN-Tagger'
source=('http://search.cpan.org/CPAN/authors/id/A/AC/ACOBURN/Lingua-EN-Tagger-0.24.tar.gz')
md5sums=('cfa309e3e3b1e8940dac35e9e0b5da18')
sha512sums=('a14dca8d843e372c6097065b52ccc009885786e7ab7fdd5c73fe0aeeb26593daf22155ecddbf1b389be2aa4f4ac03efd9a1d2e198c465a97707de6914da41cc7')
_distdir="Lingua-EN-Tagger-0.24"

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
