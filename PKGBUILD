# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-carp-assert
pkgver=0.22
pkgrel=1
pkgdesc='executable comments'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6')
url=https://metacpan.org/release/Carp-Assert
source=("https://cpan.metacpan.org/authors/id/Y/YV/YVES/Carp-Assert-$pkgver.tar.gz")
md5sums=(34df5befd63bcf66eb881e6c981c7d53)
sha512sums=(a757dd7bd5799ba98bf30fd2b55add05532af354e21e166ae1164acde71585a1b7783e28341dd8871dcc222de4bf6b78f05163e06d9f22681b7bbd547edc9c0a)
_ddir="Carp-Assert-$pkgver"

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
