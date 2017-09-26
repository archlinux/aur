# Contributor: C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-strictures'
pkgver='2.000003'
pkgrel='1'
pkgdesc="turn on strict and make most warnings fatal"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-bareword-filehandles>=0' 'perl-indirect>=0' 'perl-multidimensional>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/strictures'
source=('http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/strictures-2.000003.tar.gz')
md5sums=('78244cfab6168dcf196370d1e2309536')
sha512sums=('c187a32f70c2be97cbe783e700d54d1e7b7ce7a8ea0b5ce72851b1efbe9b64121fb4b626463c4c62fb384893e4e3102afeaa21cd3e500fefc61c5b4b3924d21b')
_distdir="strictures-2.000003"

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
