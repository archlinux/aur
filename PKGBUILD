# Maintainer: Florian Pritz <bluewind@archlinux.org>

pkgname=perl-log-any
pkgver=1.716
pkgrel=2
pkgdesc='Bringing loggers and listeners together'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl)
checkdepends=(perl-devel-stacktrace)
url=https://metacpan.org/release/Log-Any
source=("https://cpan.metacpan.org/authors/id/P/PR/PREACTION/Log-Any-$pkgver.tar.gz")
md5sums=(cc4cdb8f6a2f5015a18cef73c800793f)
sha512sums=(5f5405efb3630a260b3bc369a310b1ed0269f07e2ba76fdc4651e81fc447a8ed57c760697e3637b65e0764e16b5adb067a2db5c8205bac44d2e72a360529a695)
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
