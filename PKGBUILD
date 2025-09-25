# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious-plugin-openapi'
pkgver='5.11'
pkgrel='1'
pkgdesc="OpenAPI / Swagger plugin for Mojolicious"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=('perl-json-validator>=5.13' 'perl-mojolicious>=9.00' 'perl>=5.016')
makedepends=()
url='https://metacpan.org/release/Mojolicious-Plugin-OpenAPI'
source=('http://search.cpan.org/CPAN/authors/id/J/JH/JHTHORSEN/Mojolicious-Plugin-OpenAPI-5.11.tar.gz')
md5sums=('40259aeeb7c720441324169460e59a04')
sha512sums=('20a0fcc2fb6a4e79fafd12d9f8a5bc3d43c6df402b0815f6da8192e03a656b9d228a71b5531c74d71e6202cb5169ffadbf6f005e015f289558bfba14b1d418f4')
_distdir="Mojolicious-Plugin-OpenAPI-5.11"

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
