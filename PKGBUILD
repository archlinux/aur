# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-throwable'
pkgver='0.200013'
pkgrel='1'
pkgdesc="a role for classes that can be thrown"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-stacktrace>=1.32' 'perl-module-runtime>=0.002' 'perl-moo>=1.000001')
makedepends=()
url='https://metacpan.org/release/Throwable'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Throwable-0.200013.tar.gz')
md5sums=('92d4934f601c2d291a65b0bf2ab08dd3')
sha512sums=('81ce73709c7c6a0160da42b00ce06ddf4cce79a6801df7aa90ddcce67efed6ace17b06171ac42b2737a98515c17ab46b5a3b7fd9e5bd3079b109a977dc6c0963')
_distdir="Throwable-0.200013"

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
