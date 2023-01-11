# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-mysql'
pkgver='1.26'
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
md5sums=('da988cdeb3f4e82d88ce7f2eac39a9eb')
sha512sums=('693c1e36b00d939b9d199307065fb7051fd1a36be6f0017f6f5b40a2e61efb569956057d256bbde8bdf22d68a9e737c69c7814528a315815b6e459eb778c3621')
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
