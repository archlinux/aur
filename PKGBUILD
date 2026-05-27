# Maintainer:  Courtney Swagar <distorto@member.fsf.org>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-pg'
pkgver='5.0'
pkgrel='1'
pkgdesc="Mojolicious ♥ PostgreSQL"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbd-pg>=3.7.4' 'perl-mojolicious>=7.53' 'perl-mojo-sql>=0.02' 'perl-sql-abstract-pg>=1.0' 'perl>=5.20')
makedepends=('perl-test-deep')
url='https://metacpan.org/release/Mojo-Pg'
source=("https://cpan.metacpan.org/authors/id/S/SR/SRI/Mojo-Pg-${pkgver}.tar.gz")
md5sums=('5b296d90193de181138725bd975a2777')
sha512sums=('d7697a20abb769460b3c2987d5b8c24ce8508f49f44980452719a490de6fda8ced6e8180d9c32544f9a51cef069e4b5d856eeb87920dce9e2880f0fe87edb4cf')
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
