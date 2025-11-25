# Maintainer:  Courtney Swagar <distorto@member.fsf.org>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-pg'
pkgver='4.28'
pkgrel='1'
pkgdesc="Mojolicious ♥ PostgreSQL"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbd-pg>=3.7.4' 'perl-mojolicious>=7.53' 'perl-sql-abstract-pg>=1.0' 'perl>=5.10.1')
makedepends=('perl-test-deep')
url='https://metacpan.org/release/Mojo-Pg'
source=("https://cpan.metacpan.org/authors/id/S/SR/SRI/Mojo-Pg-${pkgver}.tar.gz")
md5sums=('26a1c47787fc84025abe4c772fb6b561')
sha512sums=('e746ae9604db01b19ad7404e8d15a8d4ea51dd827eda372ee2d47dd76304c36a1b5f7e78717e8f97b617c1014c3aca3bbee59ade5fa16068ddb5f9698a923a6d')
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
