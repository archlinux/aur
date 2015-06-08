# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-test-json'
pkgver='0.11'
pkgrel='1'
pkgdesc="Test JSON data"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json-any>=1.2' 'perl-test-differences>=0.47' 'perl-test-tester>=0.107')
makedepends=()
url='http://search.cpan.org/dist/Test-JSON'
source=('http://search.cpan.org/CPAN/authors/id/O/OV/OVID/Test-JSON-0.11.tar.gz')
md5sums=('408a9bcc1adc171e832950a4e0bba6c8')
sha512sums=('81c10485a73428f11c2275fa6788045e0299d160806c6947d7022e415dd81a4e7e49478ddf077732617e707c9c8bd181d50e984c483cf12e93fe61ec3c8aee47')
_distdir="Test-JSON-0.11"

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
