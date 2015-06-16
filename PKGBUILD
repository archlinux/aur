# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-ipc-run3'
pkgver='0.048'
pkgrel='1'
pkgdesc="run a subprocess with input/ouput redirection"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/IPC-Run3'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/IPC-Run3-0.048.tar.gz')
md5sums=('5a8cec571c51a118b265cf6e24e55761')
sha512sums=('50432850d8dccd2e59aa6684d34f3e3242fd7df3eb4d9a5eb02dae389aa46b5fd68cc54114a157c3fe99956e68e74d575ab3db5009b7bf7d5c325f1f109b1262')
_distdir="IPC-Run3-0.048"

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
