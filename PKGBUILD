# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-text-csv-xs'
pkgver='1.21'
pkgrel='1'
pkgdesc="comma-separated values manipulation routines"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/Text-CSV_XS'
source=('http://search.cpan.org/CPAN/authors/id/H/HM/HMBRAND/Text-CSV_XS-1.21.tgz')
md5sums=('892e0b43def9f1c05ddfd63038b20382')
sha512sums=('f207e2f300e3db0a310c0219c3eb6446e3be02a906810b81c7471c53c4f12646be3c0795ec5517d0c2a74dd71b88e70f42cb508797c25609ff41b00f2acc6f25')
_distdir="Text-CSV_XS-1.21"

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
