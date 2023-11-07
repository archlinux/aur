# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious-plugin-openapi'
pkgver='5.09'
pkgrel='1'
pkgdesc="OpenAPI / Swagger plugin for Mojolicious"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl-json-validator>=5.13' 'perl-mojolicious>=9.00' 'perl>=5.016')
makedepends=()
url='https://metacpan.org/release/Mojolicious-Plugin-OpenAPI'
source=('http://search.cpan.org/CPAN/authors/id/J/JH/JHTHORSEN/Mojolicious-Plugin-OpenAPI-5.09.tar.gz')
md5sums=('e454afbf88796c1d8b76eebf8a24ae63')
sha512sums=('33eee4e23e6a6cac8d9ff6473f3aec9ed82e79ddfa3a66156d9f7423b40a33b823de2991dcd19c4f1f3c1f94588c5e74c5715e3b5234848fbeb7ba99d5468265')
_distdir="Mojolicious-Plugin-OpenAPI-5.09"

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
