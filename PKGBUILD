# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-function-parameters
pkgver=2.001003
pkgrel=6
pkgdesc='define functions and methods with parameter lists ("subroutine signatures")'
arch=(x86_64)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.14.0')
checkdepends=(perl-dir-self perl-test-fatal)
url=https://metacpan.org/release/Function-Parameters
source=("https://search.cpan.org/CPAN/authors/id/M/MA/MAUKE/Function-Parameters-$pkgver.tar.gz")
md5sums=(da36fb4c1a50c7d43ffd77889b0d2547)
sha512sums=(47fd5e1e4b4d62b4576cc7439ba6f2636cef96f851e668bbd2274f79f2c4ee11fd9aa2e5739bbdfdf3ed0b3c373dc1c8d63920fd390a1d56592fbdc9be90db59)
_ddir="Function-Parameters-$pkgver"

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
