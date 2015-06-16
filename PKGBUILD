# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-hook-lexwrap'
pkgver='0.24'
pkgrel='1'
pkgdesc="Lexically scoped subroutine wrappers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='http://search.cpan.org/dist/Hook-LexWrap'
source=('http://search.cpan.org/CPAN/authors/id/C/CH/CHORNY/Hook-LexWrap-0.24.tar.gz')
md5sums=('3c08c1f388c529c532f71422d33913d1')
sha512sums=('113641b89cce644ca739eab371786971bbb966dcb0e9eb7612379063ad71318af594f351771cafc8fc0c50c8a325ed76fb257ef7f0511a6fac0a80d52039ad31')
_distdir="Hook-LexWrap-0.24"

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
