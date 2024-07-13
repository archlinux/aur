# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-crypt-random-tesha2
pkgver=0.01
pkgrel=10
pkgdesc='Random numbers using timer/schedule entropy, aka userspace voodoo entropy'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6.2')
url=https://metacpan.org/release/Crypt-Random-TESHA2
source=("https://cpan.metacpan.org/authors/id/D/DA/DANAJ/Crypt-Random-TESHA2-$pkgver.tar.gz")
md5sums=(04bdca905744ba390c5f54537e3ec931)
sha512sums=(afc95d73481cb6aa06b939ef51b5ddc14e7aaee296d08779f79313000188d7c2e5e88ddf2048dd45b9dd96420cdd7f65f0a98c8bcb4c5be77709043d558ec4ba)
_ddir="Crypt-Random-TESHA2-$pkgver"

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
