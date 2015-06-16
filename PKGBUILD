# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-indirect'
pkgver='0.33'
pkgrel='1'
pkgdesc="Lexically warn about using the indirect method call syntax."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='http://search.mcpan.org/dist/indirect'
source=('http://search.mcpan.org/CPAN/authors/id/V/VP/VPIT/indirect-0.33.tar.gz')
md5sums=('3a8c66e97f46120ff44023ee295d5acb')
sha512sums=('3cee58c3e14e6eb896916ffacef20ad41d66ed433fe0419c93eaf524db5ddfda628697241b2e8ae021835921ffc62b9db7df5e22a1465311e252de80c9e14e91')
_distdir="indirect-0.33"

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
