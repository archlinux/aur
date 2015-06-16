# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-mixin-extrafields-param'
pkgver='0.020'
pkgrel='1'
pkgdesc="make your class provide a familiar \"param\" method"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mixin-extrafields>=0.002')
makedepends=()
url='http://search.cpan.org/dist/Mixin-ExtraFields-Param'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Mixin-ExtraFields-Param-0.020.tar.gz')
md5sums=('8f44556c61149f0c340b459af3d082bb')
sha512sums=('ee901998d6e11396d6665751944227e07f12b03f0d45144f6d23b18918e8a72093d784620b75a930438f282fff1b4844e5aaf8bcc35c510059499259939522ca')
_distdir="Mixin-ExtraFields-Param-0.020"

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
