# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-regexp-parser'
pkgver='0.21'
pkgrel='1'
pkgdesc="base class for parsing regexes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Regexp-Parser'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TODDR/Regexp-Parser-0.21.tar.gz')
md5sums=('8bb8c36d27b9048bb298cfd277ddf4a9')
sha512sums=('b015eb3792cec6529304e75e02852619c1a22796ba9caf2cfdddfb80f740f0c436eae2abc7514a04ccee8d2f260c00de57b1d655ee10c1e9df294aa0a5938556')
_distdir="Regexp-Parser-0.21"

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
