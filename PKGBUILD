# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-catalyst-manual'
pkgver='5.9009'
pkgrel='1'
pkgdesc="The Catalyst developer's manual"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Catalyst-Manual'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Catalyst-Manual-5.9009.tar.gz')
md5sums=('dd87fa67fba0b3993e252810343e8121')
sha512sums=('b180fbf32ff73c8f9b939e976a451b757d89a50170d51ee4ba7c9ed1e87fe7ac494823fb87db6886952fe37851275dc71d616ac97540f4dfe2374821b156cade')
_distdir="Catalyst-Manual-5.9009"

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
