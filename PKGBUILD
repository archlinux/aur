# Maintainer: Elliott "Seylerius" Seyler <seylerius@publicinquisition.com>
# Generator : CPANPLUS::Dist::Arch 1.32

pkgname='perl-crypt-mysql'
pkgver='0.04'
pkgrel='1'
pkgdesc="emulate MySQL PASSWORD() function."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-digest-sha1>=0')
makedepends=()
url='https://metacpan.org/release/Crypt-MySQL'
source=('http://search.cpan.org/CPAN/authors/id/I/IK/IKEBE/Crypt-MySQL-0.04.tar.gz')
md5sums=('e9a2d1e7f478fe8c90a15c47de37c0ae')
sha512sums=('d9774f80789a6c5f5a0a5c410ac50f1cf4c9312c03b56258a198917a3ab5d6af6cb93cc93c7269642cc33bde8a7cf841c4184412dbb411944adccc187056d079')
_distdir="Crypt-MySQL-0.04"

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
