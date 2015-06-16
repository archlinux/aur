# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-plack-middleware-methodoverride'
pkgver='0.12'
pkgrel='1'
pkgdesc="Override REST methods to Plack apps via POST"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-plack' 'perl-uri' 'perl>=5.8.1')
makedepends=()
url='http://search.mcpan.org/dist/Plack-Middleware-MethodOverride'
source=('http://search.mcpan.org/CPAN/authors/id/A/AR/ARISTOTLE/Plack-Middleware-MethodOverride-0.12.tar.gz')
md5sums=('02971e5e0d3350730a0c30481672ac0b')
sha512sums=('150aeb8cc940fa83fae81f7b8a20432a48b4e0ba35a04c558e3f7b4dc9eeb24897ae9351492de511ce457623e2190b518c87cfdc189b40559c9009fe9d7b0991')
_distdir="Plack-Middleware-MethodOverride-0.12"

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
