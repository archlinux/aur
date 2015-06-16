# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-dom'
pkgver='0.053'
pkgrel='1'
pkgdesc="A Perl implementation of the HTML Document Object Model"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-css-dom>=0.07' 'perl-html-encoding' 'perl-html-parser>=3' 'perl-html-tagset' 'perl-http-message>=1.34' 'perl-timedate' 'perl-uri')
makedepends=()
url='http://search.cpan.org/dist/HTML-DOM'
source=('http://search.cpan.org/CPAN/authors/id/S/SP/SPROUT/HTML-DOM-0.053.tar.gz')
md5sums=('1e401513ca98125858ea1dbebe62459f')
sha512sums=('310ed49d24fd6a11096bfef93b3106c7a6239fae8170b95460c84df8e02684b07d0acc772380708aaaf1b2079f08c411824596616e3f07b3e88a928efca26559')
_distdir="HTML-DOM-0.053"

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
