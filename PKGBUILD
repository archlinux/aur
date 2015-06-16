# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-search-xapian'
pkgver='1.2.19.0'
pkgrel='1'
pkgdesc="Perl XS frontend to the Xapian C++ search library."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'xapian-core')
makedepends=('perl-devel-leak')
url='http://search.mcpan.org/dist/Search-Xapian'
source=('http://search.mcpan.org/CPAN/authors/id/O/OL/OLLY/Search-Xapian-1.2.19.0.tar.gz')
md5sums=('e65abe01d551049056ab93be486e3e7f')
sha512sums=('78ba36f3b8157ef872330b88992012d3f553abc3f2322bbb1d0f3111681dd530e5b57e4989fef645401d19cb4d95f5d284a305c5470efc2911051d1765551a3f')
_distdir="Search-Xapian-1.2.19.0"

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
