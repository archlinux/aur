# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-role-identifiable'
pkgver='0.007'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose')
makedepends=()
url='https://metacpan.org/release/Role-Identifiable'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Role-Identifiable-0.007.tar.gz')
md5sums=('46bbc6db5fdcf301aadb377bab8c1d07')
sha512sums=('811c81e3fbf8499269c4db3a45d60b35ae6ff8a8d5a93308607f37c97c2f52ad4ee6db28d15497d4d1f8cb59c67f03f479632d1a2d440034e8cd711b2a5349df')
_distdir="Role-Identifiable-0.007"

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
