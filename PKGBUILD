# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-ppi-xs'
pkgver='0.902'
pkgrel='1'
pkgdesc="(Minor) XS acceleration for PPI"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ppi>=1.000' 'perl>=5.005')
makedepends=()
url='https://metacpan.org/release/PPI-XS'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/PPI-XS-0.902.tar.gz')
md5sums=('9f1fc9b4df050395b5ee314f1f77bc05')
sha512sums=('d6a1c7d291c9bab7e942ee8561a54f26983129d0f062ae6018d5f747676ba360b6a1216b560c9b27fb6d26c4e3a39c2ec7910e7eb8c6d3bd0321740dddc4b341')
_distdir="PPI-XS-0.902"

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
