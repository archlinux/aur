# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-x10'
pkgver='0.03'
pkgrel='1'
pkgdesc="Manage X10 devices in Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-astro-suntime>=0.01' 'perl-device-serialport' 'perl-time-modules')
makedepends=()
url='http://search.mcpan.org/dist/X10'
source=('http://search.mcpan.org/CPAN/authors/id/R/RO/ROBF/X10-0.03.tar.gz')
md5sums=('056b3d98fab545865148b948de6784c7')
sha512sums=('6ed2b9526732dc5f704ceb94f3a9abb51c208aabb6f127480046ce1f01ecf763e4de2dcb5bf52ef598831dbd5ba78ff9d108238001070076b0cc05c7681dea2f')
_distdir="X10-0.03"

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
