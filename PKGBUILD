# CPAN Name  : Dancer-Plugin-Database-Core
# Maintainer: camb
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-dancer-plugin-database-core'
pkgver='0.12'
pkgrel='1'
pkgdesc="Shared core for D1 and D2 Database plugins"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dbi>=0' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Dancer-Plugin-Database-Core'
source=('http://search.cpan.org/CPAN/authors/id/A/AM/AMBS/Dancer-Plugin-Database-Core-0.12.tar.gz')
md5sums=('0cbe3f849667f7b31813f1735289218d')
sha512sums=('ee169a8aa9a5cf3a6e76859157db7bae942d8cb3c083ce19011bacd44cd21c5794c1792747b24fc06102b9392eb0f5d3d0409b6f48fff1109df3ab8d9b51b80e')
_distdir="Dancer-Plugin-Database-Core-0.12"

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
