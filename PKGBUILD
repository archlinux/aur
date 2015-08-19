# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-uuid-tiny'
pkgver='1.04'
pkgrel='1'
pkgdesc="Pure Perl UUID Support With Functional Interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/UUID-Tiny'
source=('http://search.cpan.org/CPAN/authors/id/C/CA/CAUGUSTIN/UUID-Tiny-1.04.tar.gz')
md5sums=('2d7c18711e64e0a64cc7c7fbb870947e')
sha512sums=('a28b0684a558ba0e81bc99493904c0ca43c8c145d53a9343e5496695054138f1791fe423c5e714344c58a8313b46f635a3ad1cb2eb88389f6906b6cb47ddec26')
_distdir="UUID-Tiny-1.04"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
