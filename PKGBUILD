# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-find-lib'
pkgver='1.04'
pkgrel='1'
pkgdesc="Helper to smartly find libs to use in the filesystem tree"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Find-Lib'
source=('http://search.cpan.org/CPAN/authors/id/Y/YA/YANNK/Find-Lib-1.04.tar.gz')
md5sums=('bf5619b4ba1945320eccef69b028c453')
sha512sums=('b2527acce31a88c5855a83cd3e8e8af9b62b2dc6ff4a29264443dc4e85ab921a644f27d8b5774ddbdc755b51fd5dded5fa6fa7bc98dffcf41c4d2bc53fed1e43')
_distdir="Find-Lib-1.04"

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
