# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-any-moose'
pkgver='0.26'
pkgrel='1'
pkgdesc="Use Moose or Mouse modules. (Note Deprecated infavor of Moo)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose' 'perl-mouse')
makedepends=()
url='https://metacpan.org/release/Any-Moose'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Any-Moose-0.26.tar.gz')
md5sums=('f36ed5cc95497e1d4f4f617cc1cce03b')
sha512sums=('2883a216a76e5c58acea3679e1e20ab5f4646acc62644c40db3688c554730af6836628a0df259efba0a3f3fec6abf9575f53deb70f2acf0d253ba123248e9384')
_distdir="Any-Moose-0.26"

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
