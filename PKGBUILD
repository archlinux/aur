# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-getopt-long-descriptive'
pkgver=0.103
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
md5sums=('96c1a1f9cfabd50a20da208e8d13a47b')
sha512sums=('9229575bde794fa1213871fbb33a12222737d7979cf4c290200fd85c7da9e3227539809b8380a88a85675429ceb61e505bac8cc4e1408ca63ba92b4e1b33149f')
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
