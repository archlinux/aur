# Maintainer : vvch
# CPAN Name  : Devel-Confess
# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-confess'
pkgver='0.009004'
pkgrel='1'
pkgdesc="Include stack traces on all warnings and errors"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Devel-Confess'
source=('http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/Devel-Confess-0.009004.tar.gz')
md5sums=('7da7300a9aae74dc5c4c3b1105789389')
sha512sums=('29f807e378bcb286d111f82f9ad564a610ca9813ba040a137ef149179c6909859f46a4a528eed6aea12162cdb291d8f79c7f7864c64b0ce77a44d16c3d207f25')
_distdir="Devel-Confess-0.009004"

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
