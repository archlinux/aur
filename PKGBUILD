# Maintainer:  Courtney Swagar <distorto@member.fsf.org>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-sql-abstract-pg'
pkgver='1.0'
pkgrel='1'
pkgdesc="PostgreSQL features for SQL::Abstract"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sql-abstract>=2.0' 'perl>=5.016')
makedepends=()
url='https://metacpan.org/release/SQL-Abstract-Pg'
source=('https://cpan.metacpan.org/authors/id/S/SR/SRI/SQL-Abstract-Pg-1.0.tar.gz')
md5sums=('4f425a037ab3bc5b7117002dc47cb63a')
sha512sums=('544fcc730ffcd3c12bb6401ec566f4183677c7b97c58692129654fac1d8e0ef76603e66236a290c88ec5fb1019626c159398eeee476646f7bb582acce8bedd23')
_distdir="SQL-Abstract-Pg-1.0"

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
