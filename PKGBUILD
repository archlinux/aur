# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

_pkgname=Hash-FieldHash
pkgname=perl-${_pkgname,,}
pkgver=0.15
pkgrel=3
pkgdesc="Lightweight field hash for inside-out objects"
arch=('x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.5')
makedepends=('perl-test-leaktrace>=0.07' 'perl-module-build')
url='http://search.cpan.org/dist/Hash-FieldHash'
source=("http://search.cpan.org/CPAN/authors/id/G/GF/GFUJI/Hash-FieldHash-$pkgver.tar.gz")
sha256sums=('5c515707a5433796a5697b118ddbf1f216d13c5cd52f2b64292e76f7d9b7e8f1')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=.                  \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_pkgname-$pkgver"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
