# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-plack-middleware-methodoverride'
pkgver='0.15'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-plack' 'perl-uri' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Plack-Middleware-MethodOverride'
source=('http://search.cpan.org/CPAN/authors/id/D/DW/DWHEELER/Plack-Middleware-MethodOverride-0.15.tar.gz')
md5sums=('6422375e0f1ab232839becb04d3d4098')
sha512sums=('5da480668764cb5e45889cce0ccd2090f5429288b95d470201bf6b76ca69a27488e58c8964e048efbb3f168760ca843f058ad5a1359f9c9ad671eb099e8316d3')
_distdir="Plack-Middleware-MethodOverride-0.15"

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
