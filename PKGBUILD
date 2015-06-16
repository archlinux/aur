# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-warnings-illegalproto'
pkgver='0.001003'
pkgrel='1'
pkgdesc="Disable illegal prototype warnings on old Perls"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-strictures')
makedepends=()
url='http://search.mcpan.org/dist/warnings-illegalproto'
source=('http://search.mcpan.org/CPAN/authors/id/F/FR/FREW/warnings-illegalproto-0.001003.tar.gz')
md5sums=('47c885bd792b7fc30f86255fdad6e27c')
sha512sums=('f3bf840074c991165e3475d4d797d39b3f2e4b82bb1b9780756ecdfc7b250d297bd87153e31176a73c0310db2ec3bdc5def4797a1f55aa333a806d8ab8414bec')
_distdir="warnings-illegalproto-0.001003"

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
