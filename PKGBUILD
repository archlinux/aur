# Maintainer: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-software-license
pkgver=0.104004
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
md5sums=(8a51125cdb46859eeabc0c4474ae375e)
sha512sums=(0dfb3a75d0fb4f430560f995193d11f4de7e1bcd0d240f8c4586b8b2ede93635ff8ac88bcbda4ffb9fd6cec61c6c1bdeb84bb0103c0870d76f267bf4d9ce48c8)
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
