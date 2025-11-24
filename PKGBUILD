# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-furl'
pkgver='3.15'
pkgrel='1'
pkgdesc="Lightning-fast URL fetcher"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor-lite' 'perl-http-parser-xs>=0.11' 'perl-mozilla-ca' 'perl>=5.8.1')
makedepends=('perl-module-build-tiny>=0.035')
checkdepends=('perl-test-requires' 'perl-test-tcp>=2.11')
url='https://metacpan.org/release/Furl'
source=('http://search.cpan.org/CPAN/authors/id/S/SY/SYOHEX/Furl-3.15.tar.gz')
md5sums=('9e7ae8abdc7ba4497316d0d084536140')
sha512sums=('13ec4a7ad653cedc7e36493208f358c74cc62658857a650c10077d692a627ec5ab94fdf2097dd79f07b0101296160fad90230ebb5db3a952b62b87564ac980fc')
_distdir="Furl-3.15"

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
