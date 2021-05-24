# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-log-any
pkgver=1.709
pkgrel=2
pkgdesc='Bringing loggers and listeners together'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl)
url=https://metacpan.org/release/Log-Any
source=("https://cpan.metacpan.org/authors/id/P/PR/PREACTION/Log-Any-$pkgver.tar.gz")
md5sums=(38e7295e16c28cf49c385994b2aeecf9)
sha512sums=(55beff3b56185e80aa4515d9e924356ffa2430fdbfe035f9d33cb6254bd8a23382055931939d4927befcc577486fb62f86b0362725fad60e571fbf0d669775c4)
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
