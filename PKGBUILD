# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-uri-nested'
pkgver='0.10'
pkgrel='2'
pkgdesc="Nested URIs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs' 'purge')
depends=('perl-uri>=1.40' 'perl>=5.8.1')
makedepends=('perl-module-build>=0.30')
url='https://metacpan.org/release/URI-Nested'
source=('https://search.cpan.org/CPAN/authors/id/D/DW/DWHEELER/URI-Nested-0.10.tar.gz')
md5sums=('bdb8ce035cfe439edcd524d39c6bfe51')
sha512sums=('00f6bc5ac77e629b7bd82ba593f839dc2da394c5e8fafc03db2d816fffc149557ece6a50e0b82867c4e458d1dff108535bb3ec4768401a30450f51e5a827b9e4')
b2sums=('09bfcf0c9d621f8bd73a591fb01226ac48b6eb25fffa8a36d794429b23e53f1114e5cb5e58fcd7eeb8a44f76d47fb4a36a3bed04d03c4985c50ae03ba789653c')
_distdir="URI-Nested-0.10"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
