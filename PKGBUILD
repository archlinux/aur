# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-data-compare'
pkgver='1.25'
pkgrel='1'
pkgdesc="compare perl data structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-find-rule>=0.1')
makedepends=()
url='https://metacpan.org/release/Data-Compare'
source=('http://search.cpan.org/CPAN/authors/id/D/DC/DCANTRELL/Data-Compare-1.25.tar.gz')
md5sums=('6a397ab5833237f3ca05ed7277b19a7a')
sha512sums=('6db1235672030aa1afe52de1de9fac1f8a2af9eed99a3143d6c5b30669908125f584638fe06b8b33208f6d7fb734ccec7381c9411408a3f4fde1998707f748c9')
_distdir="Data-Compare-1.25"

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
