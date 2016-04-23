# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-enum'
pkgver='1.11'
pkgrel='1'
pkgdesc="C style enumerated types and bitmask flags in Perl"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='https://metacpan.org/release/enum'
source=('http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/enum-1.11.tar.gz')
md5sums=('61b1a67dfaf8e16db0c3e80824797c1b')
sha512sums=('53d7137f42e4845887f6067f16e68141827379c40c50299d36f4c44ba005cea52610c55a7eb09600ff36aac87d11b9c992e63007c1e4fe11a12e381d7515f733')
_distdir="enum-1.11"

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
