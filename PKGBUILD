# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-log-any
pkgver=1.714
pkgrel=1
pkgdesc='Bringing loggers and listeners together'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl)
checkdepends=(perl-devel-stacktrace)
url=https://metacpan.org/release/Log-Any
source=("https://cpan.metacpan.org/authors/id/P/PR/PREACTION/Log-Any-$pkgver.tar.gz")
md5sums=(5763f94601b072c6d6522a40d92a1556)
sha512sums=(35809f8da7be83b43da505fbccca472c7040fb7e89da0d3422bf0ada3b2391569ec1db738870ac9870ccbb4e5ba2ffcd98c9eac7655b940e08c4afcbf17f5867)
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
