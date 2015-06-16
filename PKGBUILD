# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-javascript-minifier-xs'
pkgver='0.09'
pkgrel='1'
pkgdesc="XS based JavaScript minifier"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/JavaScript-Minifier-XS'
source=('http://search.cpan.org/CPAN/authors/id/G/GT/GTERMARS/JavaScript-Minifier-XS-0.09.tar.gz')
md5sums=('b8d0e8110d2980573d807268bfab0768')
sha512sums=('b46e5e0fc70d6a28829f9e6878c0a8285b6b4ba680de85ffa6d567ca00d8aaced66d4e8bf800c96b923fb261095fe0722648ce930925bb55c47e549c8ef574c8')
_distdir="JavaScript-Minifier-XS-0.09"

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
