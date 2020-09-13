# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-mysql'
pkgver='1.20'
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
md5sums=('741b19cb523a222c70f1cfcb65640a6b')
sha512sums=('2d5c3b2d10a8907f8a4d59976cc5f17cc13c9cc0643f88c00d76cbc8987422ee6664efc42af7d04b45e7b0fe41eb39701d6d3e610a7bd617bb89b91ac68b8ce5')
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
