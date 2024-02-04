# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-furl'
pkgver='3.14'
pkgrel='1'
pkgdesc="Lightning-fast URL fetcher"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor-lite>=0' 'perl-http-parser-xs>=0.11' 'perl-mozilla-ca>=0' 'perl>=5.8.1')
makedepends=()
checkdepends=('perl-test-requires>=0' 'perl-test-tcp>=2.11')
url='https://metacpan.org/release/Furl'
source=('http://search.cpan.org/CPAN/authors/id/S/SY/SYOHEX/Furl-3.14.tar.gz')
md5sums=('5377b64ddebfc720e3988e96d98da1fb')
sha512sums=('bd98dcca0c9b55431ee82c4291911784720bcbbc5d653fb24e450b067cbcbabb5a3119c7fd3b5808a2e39a73e16e1231f07f19cf80476811f6d1126ac778a6d2')
_distdir="Furl-3.14"

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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
