# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-crypt-dh-gmp'
pkgver='0.00012'
pkgrel='1'
pkgdesc="Crypt::DH Using GMP Directly"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gmp>=6.0.0' 'perl')
makedepends=('perl-devel-checklib>=0.4')
checkdepends=('perl-test-requires')
url='http://search.mcpan.org/dist/Crypt-DH-GMP'
source=('http://search.mcpan.org/CPAN/authors/id/D/DM/DMAKI/Crypt-DH-GMP-0.00012.tar.gz')
md5sums=('9df5e4d790b81055d8609fa50ec31fdb')
sha512sums=('f799017db780613b6d971f626659765f282debe63207bdbc36db223030bcd8f7f478c6331372d9794bcc8207d71bfae6d62048439766916478f4b61f42c5bb6e')
_distdir="Crypt-DH-GMP-0.00012"

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
