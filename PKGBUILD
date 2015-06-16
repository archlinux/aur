# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-text-balanced'
pkgver='2.02'
pkgrel='1'
pkgdesc="Extract delimited text sequences from strings"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Text-Balanced'
source=('http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Text-Balanced-2.02.tar.gz')
md5sums=('f1f2257693b33f534db196161b92f6db')
sha512sums=('bddaae6f8c32eafb51e580e74e257ff57c2e2ab8c33f4cfb4d1f8e9a04115e4117eefcc0c4e63589a3791dbf0de2b37a69532da05676e4f2040b427b67d02f2a')
_distdir="Text-Balanced-2.02"

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
