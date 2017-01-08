# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious'
pkgver='7.14'
pkgrel='1'
pkgdesc="Real-time web framework"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Mojolicious'
source=('http://search.cpan.org/CPAN/authors/id/S/SR/SRI/Mojolicious-7.14.tar.gz')
md5sums=('7ee14e93b2e0e0c03efa2d366b15f59c')
sha512sums=('da65782734664161338a502174c1f778a48e0b4e47498f9ed298a1728ba58bc56f86ab08b88c0076518afdcdb9e0723cee4af9d3ed1213cef6446a90eaae36b6')
_distdir="Mojolicious-7.14"

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
