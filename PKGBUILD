# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-rss-parser'
pkgver='4.0'
pkgrel='1'
pkgdesc="A liberal object-oriented parser for RSS"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-errorhandler' 'perl-class-xpath>=1.4' 'perl-xml-elemental>=2.0')
makedepends=()
url='http://search.cpan.org/dist/XML-RSS-Parser'
source=('http://search.cpan.org/CPAN/authors/id/T/TI/TIMA/XML-RSS-Parser-4.0.tar.gz')
md5sums=('5ffafdcb64edd843106f7a96efac4017')
sha512sums=('ca95c78465c6055e4228a20f8099ccae7d45dc9de908ca6a458cec2c4abbf3825f56b31030f5555d71b8b82521a6589ff84030ee8824dccda0fb178b8b73c43b')
_distdir="XML-RSS-Parser-4"

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
