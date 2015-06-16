# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-syntax-highlight-engine-kate'
pkgver='0.08'
pkgrel='1'
pkgdesc="a port to Perl of the syntax highlight engine of the Kate texteditor."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=('perl-test-differences>=0.61')
url='http://search.cpan.org/dist/Syntax-Highlight-Engine-Kate'
source=('http://search.cpan.org/CPAN/authors/id/S/SZ/SZABGAB/Syntax-Highlight-Engine-Kate-0.08.tar.gz')
md5sums=('717f969580fb5894c818fbbc627cc37e')
sha512sums=('11fe36284a2334f5bf671bce1258dafe5f4df8a5bdb5cdc237db68e3916e07b759100dbe1d437e57f65231d64a13f7452e506b1fee1e20a762b8ef74760b9673')
_distdir="Syntax-Highlight-Engine-Kate-0.08"

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
