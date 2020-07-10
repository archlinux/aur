# CPAN Name  : Dancer2-Plugin-Database
# Maintainer: camb
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-dancer2-plugin-database'
pkgver='2.17'
pkgrel='1'
pkgdesc="easy database connections for Dancer2 applications"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dancer-plugin-database-core>=0.16' 'perl-dancer2>=0.166001')
makedepends=()
checkdepends=('perl-http-message>=0' 'perl-plack>=1.0032')
url='https://metacpan.org/release/Dancer2-Plugin-Database'
source=("http://search.cpan.org/CPAN/authors/id/B/BI/BIGPRESH/Dancer2-Plugin-Database-${pkgver}.tar.gz")
md5sums=('97331b7b9ee6fcf47a5d1ebb091fc95a')
sha512sums=('d41f97ad24703741e807038aa8064e3956ef55d291b84e036900c831a2700ec3d2d5dca00d387bcf60d19b98882cdf5db59254a0727c295bd7289a088b9d2332')
_distdir="Dancer2-Plugin-Database-${pkgver}"

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
