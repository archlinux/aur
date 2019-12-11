# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-mysql'
pkgver='1.18'
pkgrel='1'
pkgdesc="Mojolicious and Async MySQL/MariaDB"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbd-mysql>=4.042' 'perl-dbi>=1.627' 'perl-mojolicious>=8.03' 'perl-sql-abstract>=1.86')
makedepends=()
url='https://metacpan.org/release/Mojo-mysql'
source=("https://cpan.metacpan.org/authors/id/T/TE/TEKKI/Mojo-mysql-${pkgver}.tar.gz")
md5sums=('85924321539dd7b57091e736fcc9faea')
sha512sums=('0850a9fba32939a27b587f18f00564bcda25ed018c7ae21a8f26acc3937a38a74602b27e6015904ec3bbb39a19f30586d9b3dd69ed4e6cfbc255ac9a1de0322d')
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
