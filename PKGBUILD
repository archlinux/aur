# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname=perl-uri-db
pkgver=0.21
pkgrel=1
pkgdesc="Perl module representing database URIs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build>=0.30' 'perl-uri>=1.40' 'perl-uri-nested>=0.10')
makedepends=()
url='https://metacpan.org/release/URI-db'
source=('http://search.cpan.org/CPAN/authors/id/D/DW/DWHEELER/URI-db-0.21.tar.gz')
md5sums=('9c58d10308052cb3d947e1c9b3330b39')
sha512sums=('ee59b8dec9253f43e7b5313cc9dd924b743edeec346371d99135cfbc8d8b38066ac2c24e0f92404ba2a18daf108f04aa465c7f07d749cb9fb6f6247724e8c168')
_distdir="URI-db-0.21"

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
