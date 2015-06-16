# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-anyevent-aio'
pkgver='1.1'
pkgrel='1'
pkgdesc="truly asynchronous file and directory I/O"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-anyevent>=3.4' 'perl-io-aio>=3')
makedepends=()
url='http://search.mcpan.org/dist/AnyEvent-AIO'
source=('http://search.mcpan.org/CPAN/authors/id/M/ML/MLEHMANN/AnyEvent-AIO-1.1.tar.gz')
md5sums=('faf3a4fe3dcffb04d27fbbd2c08651b9')
sha512sums=('f4fa0ad73d917ef2e9bea254778c7ea117cc417a5eed9d2c5ee3f132ae9f25ad286ec35c97397e843da9f0dd32e3eb7e3921bf54613017e3fc9c63db3bbb9f59')
_distdir="AnyEvent-AIO-1.1"

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
