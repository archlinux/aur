# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-software-license
pkgver=0.103014
pkgrel=2
pkgdesc='packages that provide templated software licenses'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6' perl-data-section perl-text-template)
checkdepends=(perl-try-tiny)
url=https://metacpan.org/release/Software-License
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Software-License-$pkgver.tar.gz")
md5sums=(24bab4d2b3a8f3cb8533e118f5498de2)
sha512sums=(8012f9d3e8671bdcbaf52f6790f6cd2f6a0510883bb40115c222c8c685aed6697ba33b3f9df8d853841cd2eef0806d919c9038b6ba7b1057f475b3b63457069d)
_ddir="Software-License-$pkgver"

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
