# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-data-messagepack
pkgver=1.02
pkgrel=1
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
md5sums=(23afe56c52a6e7f345a801710dcfabbe)
sha512sums=(a78a035091f42c888cb3d7b952d89588ba52988a6807e4c6dc347b12a751830b1b1d36ea93b8852339e1601dad197d42c762061b95ca2d8fdb4a6c29f6fda900)
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
