# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-b-debug-cpan'
pkgver='1.26'
pkgrel='1'
pkgdesc="Perl/CPAN Module B::Debug: Walk Perl syntax tree, printing debug info about ops"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/B-Debug'
source=("http://search.cpan.org/CPAN/authors/id/R/RU/RURBAN/B-Debug-$pkgver.tar.gz")
md5sums=('260ec0e2c2b18af1d42911bfaf6b7477')
sha512sums=('d15a1b8283a9c9582cebf9d5fdc38289160c601603498eb79d120154c8643a81e256c4afe2ee938c9db04989af0544bdf312d2d0fe5b898b1dcee756d084db6e')
_distdir="B-Debug-$pkgver"

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
