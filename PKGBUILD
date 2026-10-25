# Maintainer:  Courtney Swagar <distorto@member.fsf.org>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sql-abstract-pg'
pkgver='1.01'
pkgrel='1'
pkgdesc="PostgreSQL features for SQL::Abstract"
arch=('any')
license=('Artistic-2.0' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-sql-abstract>=2.0' 'perl>=5.016')
makedepends=()
url='https://metacpan.org/release/SQL-Abstract-Pg'
source=("https://cpan.metacpan.org/authors/id/S/SR/SRI/SQL-Abstract-Pg-${pkgver}.tar.gz")
md5sums=('b894a1c624074d16e4f08cb03f9016fc')
sha512sums=('794e731de370b56bc6b0984f84b4feff003bb55eac44d1c24c2f134b9473a9550ee4a6e25ba6d2aab886e015e4d272025a6eb5115df6ace092b0594eaa8e7b48')
_distdir="SQL-Abstract-Pg-${pkgver}"

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
