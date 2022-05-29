# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-carp-assert
pkgver=0.21
pkgrel=5
pkgdesc='executable comments'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6')
url=https://metacpan.org/release/Carp-Assert
source=("https://cpan.metacpan.org/authors/id/N/NE/NEILB/Carp-Assert-$pkgver.tar.gz")
md5sums=(72e75c152cc354420719fc9728deec71)
sha512sums=(9fb96ebaf03a86edcd0262b5216b345839dc99e504738e52f883932e425cac33470fcb0e8e4653488c0d8e63e9904af311056213c63ae40bc3935eec4c0410a0)
_ddir="Carp-Assert-$pkgver"

build()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  unset PERL5LIB PERL_MM_OPT
  /usr/bin/perl Makefile.PL
  make
)

check()
(
  cd "$srcdir/$_ddir"
  export PERL_MM_USE_DEFAULT=1
  unset PERL5LIB
  make test
)

package()
(
  cd "$srcdir/$_ddir"
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
