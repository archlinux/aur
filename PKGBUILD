# Contributor: Christos Nouskas <nous@archlinux.us>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-types-uuid'
pkgver='0.004'
pkgrel='1'
pkgdesc="type constraints for UUIDs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-type-tiny>=1.000000' 'perl-uuid-tiny>=1.02' 'perl>=5.008')
makedepends=()
checkdepends=('perl-type-tiny>=0')
url='https://metacpan.org/release/Types-UUID'
source=('http://search.cpan.org/CPAN/authors/id/T/TO/TOBYINK/Types-UUID-0.004.tar.gz')
md5sums=('0dfbf735c37b04b3770d385a381eb2c8')
sha512sums=('1d342e438cc1d2b98a172b67622dbbd04e8ac33db4826dd59362869d18305dffbf27b30be3ced6249e0b2aab2a2bead1b06bb2680c5a6c6dca770adb116c9e3c')
_distdir="Types-UUID-0.004"

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
