# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-parser-lite-tree'
pkgver='0.14'
pkgrel='1'
pkgdesc="Lightweight XML tree builder"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/XML-Parser-Lite-Tree'
source=('http://search.cpan.org/CPAN/authors/id/I/IA/IAMCAL/XML-Parser-Lite-Tree-0.14.tar.gz')
md5sums=('60d815773e13dc67a370e2482b7e4aa4')
sha512sums=('049d9a63ef22f6073fb4f5cb0441e2a0224c1d4e94fb1e8236fc29f47259b4ae4cf2df186b0934c4f29dec1f10b0d413e1f67f78b11b4fb4e84808b730ec8214')
_distdir="XML-Parser-Lite-Tree-0.14"

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
