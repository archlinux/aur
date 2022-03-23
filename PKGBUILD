# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-getopt-long-descriptive'
pkgver=0.110
pkgrel=1
pkgdesc="Getopt::Long, but simpler and more powerful"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpan-meta-check>=0.011' 'perl-params-validate>=0.97' 'perl-sub-exporter>=0.972')
makedepends=()
checkdepends=('perl-test-fatal' 'perl-test-warnings>=0.005')
url='https://metacpan.org/release/Getopt-Long-Descriptive'
source=("http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Getopt-Long-Descriptive-$pkgver.tar.gz")
md5sums=('2eee85dd6f78671e101e10800c309cc7')
sha512sums=('2b04427f81367ed650e722253e995899bd7e02475186a919c42b868f429040dfe3cd7df9a107f838f2afa4b97cd30993befc69801f18a5006526a25a32b0f1a7')
_distdir="Getopt-Long-Descriptive-$pkgver"

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
