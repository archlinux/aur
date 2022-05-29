# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-statistics-descriptive
pkgver=3.0800
pkgrel=3
pkgdesc='Module of basic descriptive statistical functions.'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6' perl-list-moreutils)
makedepends=(perl-module-build)
url=https://metacpan.org/release/Statistics-Descriptive
source=("https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Statistics-Descriptive-$pkgver.tar.gz")
md5sums=(e90c10d7d0ebaf09f657b7054f0f88ac)
sha512sums=(691a99aca4214149d14c770d71b5d97eaefa2690698b0234b11ed33d7bdbc21e9b478941bb8fa46886ea3362f432eb744a3a3b3607f3d3fe189c4256884efdec)
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
