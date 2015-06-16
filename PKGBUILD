# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-moosex-object-pluggable'
pkgver='0.0013'
pkgrel='1'
pkgdesc="Make your classes pluggable"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-runtime' 'perl-moose' 'perl-try-tiny' 'perl-namespace-autoclean')
makedepends=()
checkdepends=('perl-test-fatal')
url='http://search.mcpan.org/dist/MooseX-Object-Pluggable'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-Object-Pluggable-0.0013.tar.gz')
md5sums=('ef047198af7e065cb3f02cf56daf8fdd')
sha512sums=('af0753fbd26a6b7b0173a8fdf6c386e2ea87c58832d88aaef3d70493bf23bf5a87a5bdedb19e049d8d1768ba2a98ff96243bfb17abe4d61842daa36001dfdb4e')
_distdir="MooseX-Object-Pluggable-0.0013"

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
