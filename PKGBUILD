# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-c3-adopt-next'
pkgver='0.14'
pkgrel='1'
pkgdesc="make NEXT suck less"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mro-compat')
makedepends=('perl-module-build-tiny')
checkdepends=('perl-test-exception')
url='http://search.cpan.org/dist/Class-C3-Adopt-NEXT'
source=('https://cpan.metacpan.org/authors/id/E/ET/ETHER/Class-C3-Adopt-NEXT-0.14.tar.gz')
sha256sums=('85676225aadb76e8666a6abe2e0659d40eb4581ad6385b170eea4e1d6bf34bf7')
_distdir="Class-C3-Adopt-NEXT-0.14"

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