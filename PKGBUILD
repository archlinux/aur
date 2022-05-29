# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=perl-software-license
pkgver=0.104001
pkgrel=2
pkgdesc='packages that provide templated software licenses'
arch=(any)
license=(PerlArtistic GPL)
options=(!emptydirs)
depends=('perl>=5.6' perl-data-section perl-text-template)
checkdepends=(perl-try-tiny)
url=https://metacpan.org/release/Software-License
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Software-License-$pkgver.tar.gz")
md5sums=(6d50e36d80cccc84d5c946fab4bf921b)
sha512sums=(4ba5e11e8aa34a4f59ad4028e8e4547e22d5d56e04836cf280a0fb52a2fb64c8cf5347f6f6e2c368506c35eeb7e189527e4339d11541aac34c2c28737717e34e)
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
