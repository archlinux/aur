# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-xml-encoding'
pkgver='2.08'
pkgrel='1'
pkgdesc="A perl module for parsing XML encoding maps."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-xml-parser>=2.18')
makedepends=()
url='http://search.cpan.org/dist/XML-Encoding'
source=('http://search.cpan.org/CPAN/authors/id/S/SH/SHAY/XML-Encoding-2.08.tar.gz')
md5sums=('21a602a43060d49302c86ca77aa9db33')
sha512sums=('987c702bb3f9dda1144fa648518117db5eaac741d27718c2d9827509360dc36aa3c4ee0bb5a25a6eb23bb8edb67b177683f9d66cad6a98801b99e8f7ffd29b30')
_distdir="XML-Encoding-2.08"

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
