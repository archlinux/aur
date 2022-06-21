# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-uri-db
pkgver=0.20
pkgrel=1
pkgdesc="Perl module representing database URIs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0.30' 'perl-uri>=1.40' 'perl-uri-nested>=0.10')
makedepends=()
url='https://metacpan.org/release/URI-db'
source=('http://search.cpan.org/CPAN/authors/id/D/DW/DWHEELER/URI-db-0.20.tar.gz')
md5sums=('07121e39f191d9aef43577e164bb4fac')
sha512sums=('0623f61a5d415e577f50aeedc55c1965c2c4d93c9cffaebd176daf66c626354e785c5f3971ea86bb67ba913962a94ee435bcaa4f64327bc553bc14b04ec444de')
_distdir="URI-db-0.20"

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
