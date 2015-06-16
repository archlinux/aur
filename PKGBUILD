# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalyst-view-mason'
pkgver='0.18'
pkgrel='1'
pkgdesc="Mason View Class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime' 'perl-html-mason' 'perl-mro-compat')
makedepends=()
url='http://search.cpan.org/dist/Catalyst-View-Mason'
source=('http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Catalyst-View-Mason-0.18.tar.gz')
md5sums=('43babe65905c38da7ebb9bed4dcb212c')
sha512sums=('e0bf82e8633130d19d64bb3cf4c6a78e51e29e6faf89fe48118dcf62e9b7c38ab3d92dd9c55fb70c40c88c68ffc910490715a479a329b4298bbe793a9fd9fd29')
_distdir="Catalyst-View-Mason-0.18"

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
