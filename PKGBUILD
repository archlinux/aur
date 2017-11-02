# Maintainer: Tyler Swagar <buttpickle69@shaw.ca>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-pg'
pkgver='4.02'
pkgrel='1'
pkgdesc="Mojolicious ♥ PostgreSQL"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbd-pg' 'perl-mojolicious>=7.15' 'perl-sql-abstract>=1.81' 'perl>=5.10.1')
makedepends=()
url='https://metacpan.org/release/Mojo-Pg'
source=("https://cpan.metacpan.org/authors/id/S/SR/SRI/Mojo-Pg-${pkgver}.tar.gz")
md5sums=('0700d00ac9f0258a57afa219363bfb7f')
sha512sums=('c91494c3020f1d6a7f125ac7d10a96c0723e3a76dd6263adf22d0a261d697de13b62fee89148f561c358d1c9ccf89419e836b7d014bd869d6d59c03cd2c46850')
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
