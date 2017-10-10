# Maintainer: Michael Gerdau <mgd@qata.de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-cpanplus-dist-build'
pkgver='0.88'
pkgrel='1'
pkgdesc="CPANPLUS plugin to install packages that use Build.PL"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cpanplus>=0.84' 'perl-module-build>=0.32' 'perl>=5.006')
makedepends=()
url='https://metacpan.org/release/CPANPLUS-Dist-Build'
source=('http://search.cpan.org/CPAN/authors/id/B/BI/BINGOS/CPANPLUS-Dist-Build-0.88.tar.gz')
md5sums=('ce4cfe7da5100dbdeb346845dfba9982')
sha512sums=('af19985ded89e3a82b616ca82aa476bc623ef1038b5ceb2d97997830041b18aaf3ec7779121cc088e8e35b6c82ea7918fc1a62402f63be753c7466a522149a12')
_distdir="CPANPLUS-Dist-Build-0.88"

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
