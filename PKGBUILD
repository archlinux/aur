# Maintainer : Blair Bonnett <blair dot bonnett at gmail dot com>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-system-command
pkgver=1.121
pkgrel=1
pkgdesc="Object for running system commands"
_dist=System-Command
arch=('any')
license=('PerlArtistic' 'GPL')
options=(purge '!emptydirs')
depends=(perl)
url="https://metacpan.org/release/$_dist"
source=("https://cpan.metacpan.org/authors/id/B/BO/BOOK/$_dist-$pkgver.tar.gz")
md5sums=('b7d5c4df678bd8923464d5ab66613dba')
sha256sums=('43de5ecd20c1da46e8a6f4fceab29e04697a2890a99bf6a91b3ca004a468a241')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
