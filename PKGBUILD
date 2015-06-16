# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-accessor-fast-xs'
pkgver='0.04'
pkgrel='1'
pkgdesc="XS replacement for Class::Accessor::Fast"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor')
makedepends=()
url='http://search.cpan.org/dist/Class-Accessor-Fast-XS'
source=('http://search.cpan.org/CPAN/authors/id/R/RU/RUZ/Class-Accessor-Fast-XS-0.04.tar.gz')
md5sums=('6a927f2b39e6c2c69f4e519f96310779')
sha512sums=('3fca8097c6e08de64efdc976300120d35e5606daf95a116a2d211753030980c2ffc4556df2ec67abd11047f3af580ca0b6ec05ca5b265cde2523ce29b272027f')
_distdir="Class-Accessor-Fast-XS-0.04"

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
