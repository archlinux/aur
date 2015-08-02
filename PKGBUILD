# Contributor: chimeracoder <dev@chimeracoder.net>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-log-dispatch-array'
pkgver='1.003'
pkgrel='1'
pkgdesc="log events to an array (reference)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-log-dispatch>=0')
makedepends=()
checkdepends=('perl-test-deep>=0')
url='http://search.cpan.org/dist/Log-Dispatch-Array'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Log-Dispatch-Array-1.003.tar.gz')
md5sums=('e4c6caa0c6907fee5562ab8f9ab49021')
sha512sums=('00482172dc41355de5a27f7ae167c1f2c8644c41a2484e4fd5709765ab6a413d15ec268af89cef6a521a0a5570be2652b02efec9a717e8325bbfb8fd51a4bb68')
_distdir="Log-Dispatch-Array-1.003"

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
