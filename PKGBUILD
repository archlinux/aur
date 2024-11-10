# Maintainer : Dylan Delgado <dylan1496 at live dot com>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-math-int64'
pkgver='0.57'
pkgrel='1'
pkgdesc="Manipulate 64 bits integers in Perl"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Math-Int64'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SALVA/Math-Int64-0.57.tar.gz')
md5sums=('ed431cca1c403b1078fb1b3e2860d8de')
sha512sums=('2039822523dd7b960b0015e68b9caa1e3061a7434c2931f0cc49c503ee8dd17178cef5cebf69a6907af82564bc1f09946e9817fc4c4b19757b91fe2ef5423b9e')
_distdir="Math-Int64-0.57"

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
