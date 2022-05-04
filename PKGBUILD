# Maintainer: int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dbix-runsql'
pkgver='0.22'
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
md5sums=('87addde9a3e6d3880f2bd76ff21632f6')
sha512sums=('eb0b17c4cdfbfdac86d4ffceb16eb07db5ec79523da1525a603bc6953749f7b1e168f74c0ed52bb3f67206dbe343a894317e54657c0e597e1708a015d445527e')
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
