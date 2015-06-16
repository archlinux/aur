# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-lexical-var'
pkgver='0.007'
pkgrel='1'
pkgdesc="static variables without namespace pollution"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-lexical-sealrequirehints>=0.006')
makedepends=()
url='http://search.cpan.org/dist/Lexical-Var'
source=('http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/Lexical-Var-0.007.tar.gz')
md5sums=('cba23ac550e0a0ffaa8685cad198936d')
sha512sums=('281ca88d601d0617b69eb4b0eee7cd33a0717584eaa5b03d3d5dd050c8c0ded20c1584feb9948c96a44fa216ff28d985c7e11eb54ca5ea19009ddbcd42ceea14')
_distdir="Lexical-Var-0.007"

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
