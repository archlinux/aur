# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-mojo-base-xs'
pkgver='0.07'
pkgrel='1'
pkgdesc="very fast Mojo-styled accessors"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.010')
makedepends=()
url='http://search.cpan.org/dist/Mojo-Base-XS'
source=('http://search.cpan.org/CPAN/authors/id/Y/YK/YKO/Mojo-Base-XS-0.07.tar.gz')
md5sums=('657a93cfb391a747ae4f9ee044ca7716')
sha512sums=('df55ba92fba8e349b331793fa5d249d0d6ea79391a87288e4060d99ece3fda15923c1c8a2dc9bfd382e734f24303766cf104d29229889ca90f4aeb7c693cf7f1')
_distdir="Mojo-Base-XS-0.07"

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
