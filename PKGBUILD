# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-string-prettify'
pkgver='1.04'
pkgrel='1'
pkgdesc="subs to cleanup a filename and or garble for human eyes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/String-Prettify'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEOCHARRE/String-Prettify-1.04.tar.gz')
md5sums=('e0e71f7035368b9f5dfded2bf89ff279')
sha512sums=('5b14916e6888ff00838a63a78dafc3e6cd339d0c5e7c8a420952e6c60c4f5a2db70e1c1c1be1cb8abd90c3137fe7004ac00f709113f9c5f6e1c3fa1d8d28276d')
_distdir="String-Prettify-1.04"

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
