# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-data-walk'
pkgver='1.00'
pkgrel='1'
pkgdesc="Traverse Perl data structures."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Data-Walk'
source=('http://search.cpan.org/CPAN/authors/id/G/GU/GUIDO/Data-Walk-1.00.tar.gz')
md5sums=('868c636781ccd061b0b2a53d4a409e12')
sha512sums=('0941569dd90d7de62095d4ee1a346035fde284d57fb89863b9bd13cf93855064a875b6f7591908b7af4a8a79210684d4a002bc576e7e1cb299a1c0a268d4f9bf')
_distdir="Data-Walk-1.00"

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
