# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-file-next
pkgver=1.18
pkgrel=4
pkgdesc='File-finding iterator'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=(perl)
url=https://metacpan.org/release/File-Next
source=("https://cpan.metacpan.org/authors/id/P/PE/PETDANCE/File-Next-$pkgver.tar.gz")
md5sums=(8ad70cbaf936c3867fcc017d50ee6c25)
sha512sums=(951ad995b40ddda359a10ba2d7e19622059da03e7aaa3411e2e887633fbf7720554dc3f98ad581b245b2ffb51ea79f7c5eedecf6e943359eb407df0f9014e627)
_ddir="File-Next-$pkgver"

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
