# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-statistics-descriptive
pkgver=3.0612
pkgrel=3
pkgdesc='Module of basic descriptive statistical functions.'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6' perl-list-moreutils)
makedepends=(perl-module-build)
url=https://metacpan.org/release/Statistics-Descriptive
source=("http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Statistics-Descriptive-$pkgver.tar.gz")
md5sums=(e38cfbc1e3962d099b62a14a57a175f1)
sha512sums=(1157c0259a376f44363861c515ef56a25cf5a496d67faea546e225751d39c3529f9aa7d1bd021e2e399d5e884e7f5372df67249fe4f5607a6bdd806235503d46)
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
