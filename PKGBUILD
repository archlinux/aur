# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious-plugin-openapi'
pkgver='5.08'
pkgrel='1'
pkgdesc="OpenAPI / Swagger plugin for Mojolicious"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json-validator>=5.13' 'perl-mojolicious>=9.00' 'perl>=5.016')
makedepends=()
url='https://metacpan.org/release/Mojolicious-Plugin-OpenAPI'
source=('http://search.cpan.org/CPAN/authors/id/J/JH/JHTHORSEN/Mojolicious-Plugin-OpenAPI-5.08.tar.gz')
md5sums=('1b2f408adef4f030cb9346ff9bf27d5a')
sha512sums=('bbe9acc4282f08e7e8260e149bc6e96fe97097c24a2fd61091e87d1af49982f63389e9d13c5f5f4a4451f56e72b15fe6046c2c2c7bf3c10dbef252d9aaa69935')
_distdir="Mojolicious-Plugin-OpenAPI-5.08"

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
