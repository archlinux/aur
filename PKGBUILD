# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-mojolicious-plugin-oauth2'
pkgver='1.1'
pkgrel='1'
pkgdesc="Auth against OAuth2 APIs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-socket-ssl' 'perl-mojolicious>=1.64')
makedepends=()
url='http://search.mcpan.org/dist/Mojolicious-Plugin-OAuth2'
source=('http://search.mcpan.org/CPAN/authors/id/M/MR/MRAMBERG/Mojolicious-Plugin-OAuth2-1.1.tar.gz')
md5sums=('c90240559d8286c52fc154f494d94637')
sha512sums=('db0d52a24fc3f7682332725667bfc422ce924fac25ac116d5117109a755228d93b8038cb754bd2bec9983871254947290fd02107093c7900658f4665fd1fd7bf')
_distdir="Mojolicious-Plugin-OAuth2-1.1"

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
