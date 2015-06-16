# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-je'
pkgver='0.060'
pkgrel='1'
pkgdesc="Pure-Perl ECMAScript (JavaScript) Engine"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-timedate')
makedepends=()
url='http://search.cpan.org/dist/JE'
source=('http://search.cpan.org/CPAN/authors/id/S/SP/SPROUT/JE-0.060.tar.gz')
md5sums=('f256a0ec25d57c0ea0d58cf4930dc997')
sha512sums=('9dfe88797cb8946b6c360c59cb5087523ec334e7f60933aab26da9fc2aa58c4cedf437393dd0d47de304ef9dba597690d754dbab112a858fb61950bef4660499')
_distdir="JE-0.060"

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
