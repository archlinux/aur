# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dbix-runsql'
pkgver='0.17'
pkgrel='1'
pkgdesc="Perl/CPAN Module DBIx::RunSQL: run SQL from a file"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi' 'perl>=5.006')
optdepends=('perl-dbd-sqlite: SQLite support')
makedepends=()
url='https://metacpan.org/release/DBIx-RunSQL'
source=("http://search.cpan.org/CPAN/authors/id/C/CO/CORION/DBIx-RunSQL-$pkgver.tar.gz")
md5sums=('2bc42d2fcb83bfbf4a1f002b1c5a2212')
sha512sums=('03bd10f1c9753b604e9e85480c97080d3a9f400b0175c4fe5aae49349e0e8ad962403d5d4067ddb41f305809bf183dcd022a1fb376be1288443bad7e68d97320')
_distdir="DBIx-RunSQL-$pkgver"

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
