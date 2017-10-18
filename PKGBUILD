# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-webservice-ils'
pkgver='0.16'
pkgrel='1'
pkgdesc="Perl/CPAN Module WebService::ILS: Standardised library discovery/circulation services"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-tiny' 'perl-http-message' 'perl-hash-merge' 'perl-json' 'perl-modern-perl' 'perl-uri' 'perl-libwww' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/WebService-ILS'
source=("http://search.cpan.org/CPAN/authors/id/S/SR/SRDJAN/WebService-ILS-$pkgver.tar.gz")
md5sums=('4892e70cfa21a80d2edc210dd677bee6')
sha512sums=('459f3078e0b502377605f1f4f9886f7cc2ca26fc4edaa02dcb54c8d458d0a57ad28678c0ad4be84b13c768efb68be40a8d8bead88106affc4929b20cba8df928')
_distdir="WebService-ILS-$pkgver"

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
