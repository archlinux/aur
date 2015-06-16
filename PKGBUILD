# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-b-hooks-op-check-entersubforcv'
pkgver='0.09'
pkgrel='1'
pkgdesc="Invoke callbacks on construction of entersub OPs for certain CVs"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-b-hooks-op-check>=0.19' 'perl-b-utils>=0.19' 'perl-extutils-depends')
url='http://search.cpan.org/dist/B-Hooks-OP-Check-EntersubForCV'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/B-Hooks-OP-Check-EntersubForCV-0.09.tar.gz')
md5sums=('5eb9a1c6038acf0a6da0a28f25c862f1')
sha512sums=('c6d9941cbf2fc63c56605d23df6cb8a68ea5ca43fa72419f67867e9651173c28f22c5381422d31d9b8dab79b868f6b0c59474ec7545636903485d73e4f6a9aee')
_distdir="B-Hooks-OP-Check-EntersubForCV-0.09"

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
