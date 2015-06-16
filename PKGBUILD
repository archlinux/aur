# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-dbi-plugin'
pkgver='0.03'
pkgrel='1'
pkgdesc="Abstract base class for Class::DBI plugins"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-dbi>=0.9')
makedepends=()
url='http://search.cpan.org/dist/Class-DBI-Plugin'
source=('http://search.cpan.org/CPAN/authors/id/J/JC/JCZEUS/Class-DBI-Plugin-0.03.tar.gz')
md5sums=('b020611a93fe51cbcdfd78f2cbf872cb')
sha512sums=('1e42673d2cee46f3d2b763de9236c4bd6603d0f85e8eae9cca49d90fd4353dd2a43adf6dbad403774f72ad11090130f5234af85c18ba3192e4bf924e020350bc')
_distdir="Class-DBI-Plugin-0.03"

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
