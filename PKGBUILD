# Maintainer:  Courtney Swagar <distorto@member.fsf.org>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-pg'
pkgver='5.01'
pkgrel='1'
pkgdesc="Mojolicious ♥ PostgreSQL"
arch=('any')
license=('Artistic-2.0' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-dbd-pg>=3.7.4' 'perl-mojolicious>=7.53' 'perl-mojo-sql>=0.02' 'perl-sql-abstract-pg>=1.0' 'perl>=5.20')
makedepends=('perl-test-deep')
url='https://metacpan.org/release/Mojo-Pg'
source=("https://cpan.metacpan.org/authors/id/S/SR/SRI/Mojo-Pg-${pkgver}.tar.gz")
md5sums=('ce8713a6591269dbf49aae3683ade69e')
sha512sums=('875aba7ebc35b1f11cc23747473e53c1f6383e543ac857bb0a03188f4b6940479042d4953b8ff667394f293ede911822c08a8daa1e8dbc32f6f4e835b6f2a9cd')
_distdir="Mojo-Pg-${pkgver}"

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
