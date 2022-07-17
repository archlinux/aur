# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-software-license
pkgver=0.104002
pkgrel=1
pkgdesc='packages that provide templated software licenses'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6' perl-data-section perl-text-template)
makedepends=('perl-extutils-makemaker>=6.78')
checkdepends=(perl-try-tiny)
url=https://metacpan.org/release/Software-License
source=("https://cpan.metacpan.org/authors/id/L/LE/LEONT/Software-License-$pkgver.tar.gz")
md5sums=(80b99d810ccaede171bcad323471b2a2)
sha512sums=(80303349f1d1febfb61322d106587880e0191500229110eebf1b8fb6653dc212720a29c60d9575bd4bb077b83755592303dc4205df276193d8fa0252f21e01aa)
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
