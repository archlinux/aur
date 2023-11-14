# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-text-trim'
pkgver='1.04'
pkgrel='1'
pkgdesc="remove leading and/or trailing whitespace from strings"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='https://metacpan.org/release/Text-Trim'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJT/Text-Trim-1.04.tar.gz')
md5sums=('555a54e3da662bc5c187d99aa0e923ce')
sha512sums=('e26eeffde15c9d793cd69434296aa135f3f46e6abb7f4a0bee71f34aa6e1a9135c141a25d73b7714609c7a30e57eaefd198f7282945bb3585bfff0315ff3f431')
_distdir="Text-Trim-1.04"

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
