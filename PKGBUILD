# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-log-any
pkgver=1.708
pkgrel=1
pkgdesc='Bringing loggers and listeners together'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl)
url=https://metacpan.org/release/Log-Any
source=("https://cpan.metacpan.org/authors/id/P/PR/PREACTION/Log-Any-$pkgver.tar.gz")
md5sums=(2ee5e3b84f54542d3f8dad26b2426985)
sha512sums=(7cb86cb376140cd99a1f5aca97e5991ae958dbea39c64db3f095663341160cda055572694679f281581e0ba5c2a74d92c27a13aaed6b40f33c6f95d0c3ac7523)
_ddir="Log-Any-$pkgver"

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
