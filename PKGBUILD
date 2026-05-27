# Maintainer:  Courtney Swagar <distorto@member.fsf.org>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-sql'
pkgver='0.02'
pkgrel='1'
pkgdesc="Safely generate and compose SQL statements"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=9.41' 'perl>=5.020')
makedepends=()
url='https://metacpan.org/release/Mojo-SQL'
source=('https://cpan.metacpan.org/authors/id/S/SR/SRI/Mojo-SQL-0.02.tar.gz')
md5sums=('f9520127a71f030427a6e05ce90a8022')
sha512sums=('47fb6222f48e621ab339ccdbd5ec5431b934bd797a410463a51366e94f105ee369bb70f01d03ea873b88d859c7dfade1dbe077d9ca2a9f78b9150d2c930a56d6')
_distdir="Mojo-SQL-0.02"

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
