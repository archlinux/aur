# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-hash-multivalue'
pkgver='0.15'
pkgrel='1'
pkgdesc="Store multiple values per key"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Hash-MultiValue'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Hash-MultiValue-0.15.tar.gz')
md5sums=('eb7df1402b774b07a305dbb67873817a')
sha512sums=('fd97db887590c8c9ecbd0e58434df01fae8e3d2aa2335245ea1217d454e50c3bf1177921dd340f4cca3685808bebc573d13c892da7ccd685d3658c1db9d96465')
_distdir="Hash-MultiValue-0.15"

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
