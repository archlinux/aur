# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-minion'
pkgver='5.05'
pkgrel='1'
pkgdesc="Job queue"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=6.0' 'perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Minion'
source=('http://search.cpan.org/CPAN/authors/id/S/SR/SRI/Minion-5.05.tar.gz')
md5sums=('f6a91a7afe4868ef842bb73e51a92abf')
sha512sums=('fb56ef9b347c8520757276043bf5fcbdc75bf2de51d20aac4bda255cfcf43e6902842bd53cebad43a4c14f2fde0c673a985a95554327c8d1d484407ac20b1142')
_distdir="Minion-5.05"

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
