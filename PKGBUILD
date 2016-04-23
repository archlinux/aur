# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-mock-guard'
pkgver='0.10'
pkgrel='1'
pkgdesc="Simple mock test library using RAII."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load>=0.06' 'perl>=5.8.1')
makedepends=()
url='https://metacpan.org/release/Test-Mock-Guard'
source=('http://search.cpan.org/CPAN/authors/id/X/XA/XAICRON/Test-Mock-Guard-0.10.tar.gz')
md5sums=('b2866485cc29c787f85793279e2f2360')
sha512sums=('17a8cbfea9e33a625ad5a33b40b5a799715d59b57eb4030a9d694fdd1e7361667f326888577291f0807852b86c04b97384ab8a48d95eb92158d35e14131068cc')
_distdir="Test-Mock-Guard-0.10"

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
