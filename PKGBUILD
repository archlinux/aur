# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-leocharre-basename'
pkgver='1.08'
pkgrel='1'
pkgdesc="very basic filename string and path operations such as ext and paths"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/LEOCHARRE-Basename'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEOCHARRE/LEOCHARRE-Basename-1.08.tar.gz')
md5sums=('326e383de8392b0509b51c4d25af60f0')
sha512sums=('ea06509c371cf1905bd67363557873a013450fc322fc7402f6bef9fd5b0f06f2fd2ae8f8ebd7164b13d0ecf7027278b9c036d5d5ec0f8a0c4707212f37d6b1fb')
_distdir="LEOCHARRE-Basename-1.08"

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
