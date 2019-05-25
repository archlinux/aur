# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-statistics-descriptive
pkgver=3.0702
pkgrel=2
pkgdesc='Module of basic descriptive statistical functions.'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6' perl-list-moreutils)
makedepends=(perl-module-build)
url=https://metacpan.org/release/Statistics-Descriptive
source=("http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Statistics-Descriptive-$pkgver.tar.gz")
md5sums=(7d367a2b1b057261edd48efcbe66eb97)
sha512sums=(e0742ec356a38ad38f52e56a3ef58af6e539fbfa090d9a1d154560f353a3346d1c800d5d9f7bb0e2f32fb92b611fec16c939a19b7af104ec6ebe627c6c719df6)
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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
