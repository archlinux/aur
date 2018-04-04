# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-webservice-ils'
pkgver='0.17'
pkgrel='1'
pkgdesc="Perl/CPAN Module WebService::ILS: Standardised library discovery/circulation services"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-tiny' 'perl-http-message' 'perl-hash-merge' 'perl-json' 'perl-modern-perl' 'perl-uri' 'perl-libwww' 'perl>=5.8.1')
makedepends=('perl-module-build-tiny')
url='https://metacpan.org/release/WebService-ILS'
source=("http://search.cpan.org/CPAN/authors/id/S/SR/SRDJAN/WebService-ILS-$pkgver.tar.gz")
md5sums=('9a9ef46e4cf411ec64185156ff3bd8ee')
sha512sums=('218f2b183f0b688225495f341090e465341c4e364e8b15013ff739a8e73e578c84a797af38a8aec5ec8f99adfacb94de1489846438a29c269ecbf960a04e1bb0')
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
