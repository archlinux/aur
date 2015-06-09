# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-leocharre-strings'
pkgver='1.02'
pkgrel='1'
pkgdesc="Combines string procedures I frequently use"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-smart-comments>=1' 'perl-string-prettify>=1.03' 'perl-string-shellquote>=1.03')
makedepends=()
url='http://search.cpan.org/dist/LEOCHARRE-Strings'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEOCHARRE/LEOCHARRE-Strings-1.02.tar.gz')
md5sums=('e3990780081dccc29aabce56750ef2a9')
sha512sums=('fc2180d744c9f0ce23a28149ddf21b81a51d6eb0c3d3420ad87dd00fecd1dbbab416e69bbefbcf4c9a32d3b95b53c6a9a56d00f3f4622a34978f959e331a0274')
_distdir="LEOCHARRE-Strings-1.02"

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
