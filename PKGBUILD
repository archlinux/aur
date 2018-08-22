# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-getopt-long-descriptive'
pkgver=0.100
pkgrel=2
pkgdesc="Getopt::Long, but simpler and more powerful"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-meta-check>=0.011' 'perl-params-validate>=0.97' 'perl-sub-exporter>=0.972')
makedepends=()
checkdepends=('perl-test-fatal' 'perl-test-warnings>=0.005')
url='https://metacpan.org/release/Getopt-Long-Descriptive'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Getopt-Long-Descriptive-0.100.tar.gz')
md5sums=('de219672e59bab7137d8f0e4219f41a5')
sha512sums=('0efd6f707487b9b44d5c3b5c9e46c3718546e44bf1b66c198be6ebfc922e7bdb23a9c57c5a9c0985dc3769617141696750e1bd982457247b679e3bdb5f9f16c7')
_distdir="Getopt-Long-Descriptive-0.100"

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

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
