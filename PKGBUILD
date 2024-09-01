# Maintainer: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-statistics-descriptive
pkgver=3.0801
pkgrel=3
pkgdesc='Module of basic descriptive statistical functions.'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6' perl-list-moreutils)
makedepends=(perl-module-build)
url=https://metacpan.org/release/Statistics-Descriptive
source=("https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Statistics-Descriptive-$pkgver.tar.gz")
md5sums=(111c2dc95231843707ce52b1e7f22676)
sha512sums=(e5901ed4f53807a53779113ad9288549dcf06618d2a81009f388edce0ead9f1178ce63eea07c0a427a3f00b6216f6e211cc2ca9b1c5fa91c82e4994343a33f35)
_ddir="Statistics-Descriptive-$pkgver"

build()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  unset PERL5LIB PERL_MB_OPT
  /usr/bin/perl Build.PL
  ./Build
)

check()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  unset PERL5LIB PERL_MB_OPT
  ./Build test
)

package()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  unset PERL5LIB PERL_MB_OPT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
