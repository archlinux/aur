# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-router-simple'
pkgver='0.15'
pkgrel='1'
pkgdesc="simple HTTP router"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor-lite>=0.05' 'perl>=5.008_001')
makedepends=()
url='http://search.mcpan.org/dist/Router-Simple'
source=('http://search.mcpan.org/CPAN/authors/id/T/TO/TOKUHIROM/Router-Simple-0.15.tar.gz')
md5sums=('b50f47030795d7e33e07f22bc6f60119')
sha512sums=('3c5f4a2f70bdc578e32f7fad23d9d3e22f6de26dc1abc8f280ea59b15b307bfa55907902de9e9cfde5c80f89f360ac6f75c77e436320dd4e1be52f536e386387')
_distdir="Router-Simple-0.15"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
