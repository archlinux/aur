# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-mysql'
pkgver='1.28'
pkgrel='1'
pkgdesc="Mojolicious and Async MySQL/MariaDB"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=('perl-dbd-mysql>=4.050' 'perl-dbi>=1.643' 'perl-mojolicious>=8.03' 'perl-sql-abstract>=1.86')
makedepends=()
checkdepends=('perl-test-deep')
url='https://metacpan.org/release/Mojo-mysql'
source=("http://search.cpan.org/CPAN/authors/id/J/JH/JHTHORSEN/Mojo-mysql-${pkgver}.tar.gz")
md5sums=('e82db52365f6d57625760066ce8e26e1')
sha512sums=('9b1038b01ff498616edaa0f62652b696e895f81380f8a7facb6b7322da5826811a40aed85531351235703065434bfb2babed0cd7e2313d2f2b05bcdc1e934942')
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
