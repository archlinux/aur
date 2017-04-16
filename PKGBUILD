# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sys-mmap'
pkgver='0.19'
pkgrel='1'
pkgdesc="uses mmap to map in a file as a Perl variable"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Sys-Mmap'
source=('http://search.cpan.org/CPAN/authors/id/S/SW/SWALTERS/Sys-Mmap-0.19.tar.gz')
md5sums=('990c9106a88dc843035f7bcb109e6c0e')
sha512sums=('4e6409cddd13322b4cdaad832e6d0233776e51098b499fd05d8e642e547eb1ed7add5bb9fb339e69048a3293140098e282b51698eb6d188ace71ad58c1628556')
_distdir="Sys-Mmap-0.19"

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
