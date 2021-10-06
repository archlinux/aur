# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-mysql'
pkgver='1.24'
pkgrel='1'
pkgdesc="Mojolicious and Async MySQL/MariaDB"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbd-mysql>=4.050' 'perl-dbi>=1.643' 'perl-mojolicious>=8.03' 'perl-sql-abstract>=1.86')
makedepends=()
checkdepends=('perl-test-deep')
url='https://metacpan.org/release/Mojo-mysql'
source=("http://search.cpan.org/CPAN/authors/id/J/JH/JHTHORSEN/Mojo-mysql-${pkgver}.tar.gz")
md5sums=('6640a9570ac10129862d705eeca218b2')
sha512sums=('cefd6221a317846b4038a6583b20484031cee79a32cfd728db111b8ece845bb729f41874d1c180f8d3073297c445473ca58b2a35962919dd738fe5b0c1b5113c')
_distdir="Mojo-mysql-${pkgver}"

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
