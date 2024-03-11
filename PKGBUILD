# Maintainer: András Wacha < awacha at gmail >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-starlink-ast'
pkgver='3.03'
pkgrel='2'
pkgdesc="Interface to the Starlink AST library"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-pgplot' 'perl-tk' 'perl-tk-zinc')
makedepends=('perl-module-build')
checkdepends=('perl-test-deep>=0' 'perl-test-number-delta>=0')
url='https://metacpan.org/release/Starlink-AST'
source=("https://cpan.metacpan.org/authors/id/G/GS/GSB/Starlink-AST-${pkgver}.tar.gz")
md5sums=('688173a0c9f9ba4debd36f864abd6b93')
sha512sums=('c1f64b19ab50f3704a440208b0c82bfaaf10322c807f817dc52d742d2c1fdf0087ae07f392c97f277fa18862ca9ec102d219e13385cec1bd6f726c79a04d8d68')
_distdir="Starlink-AST-${pkgver}"



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
    unset DISPLAY
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
