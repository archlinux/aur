# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-data-messagepack
pkgver=1.01
pkgrel=3
pkgdesc='MessagePack serializing/deserializing'
arch=(x86_64)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.8.1')
makedepends=('perl-devel-ppport>=3.42' 'perl-module-build>=0.4005'
             perl-module-build-xsutil)
checkdepends=(perl-test-requires)
url=https://metacpan.org/release/Data-MessagePack
source=("https://cpan.metacpan.org/authors/id/S/SY/SYOHEX/Data-MessagePack-$pkgver.tar.gz")
md5sums=(f75e916e948076d3f059e593064199ea)
sha512sums=(7440f658df717ed54b20851b0af2eb22e5edf3dec1c749cae4974a30cb8c68105f0c326f06393be35f73ea8b1ef08a4f490aa8ca85b6b53430472084e092f957)
_ddir="Data-MessagePack-$pkgver"

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
