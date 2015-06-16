# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-sax-expat-incremental'
pkgver='0.05'
pkgrel='1'
pkgdesc="Incremental/non-blocking SAX Driver for Expat"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-parser' 'perl-xml-sax-expat')
makedepends=('perl-test-exception')
url='http://search.cpan.org/dist/XML-SAX-Expat-Incremental'
source=('http://search.cpan.org/CPAN/authors/id/N/NU/NUFFIN/XML-SAX-Expat-Incremental-0.05.tar.gz')
md5sums=('f6f4c46190510c23a4990ef5e3fc54b3')
sha512sums=('e9e9601d907b402b9185e3e639cb35992fb8969fff8cfebf8da6ad930e94b8ac0b727b162512135a2cb814659e4700c18e22ddf172f516756c200d729bdb4ee4')
_distdir="XML-SAX-Expat-Incremental-0.05"

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
