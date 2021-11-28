# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-mysql'
pkgver='1.25'
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
md5sums=('a1de6ea143151f548ba2565b8131ba7f')
sha512sums=('c691b8191dee70e1b5a5bdf16f2b61312837febf497b37e16d6e7e1afdc3f6a07058f2b335e2fd4899e7c14d4c6cf6876cdc1b03c52d1e6988833bea45c39771')
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
