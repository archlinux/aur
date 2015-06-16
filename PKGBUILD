# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-mousex-traits'
pkgver='0.1102'
pkgrel='1'
pkgdesc="automatically apply roles at object creation time"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mouse>=0.81')
makedepends=('perl-test-use-ok>=0')
checkdepends=('perl-test-exception>=0')
url='http://search.cpan.org/dist/MouseX-Traits'
source=('http://search.cpan.org/CPAN/authors/id/G/GF/GFUJI/MouseX-Traits-0.1102.tar.gz')
md5sums=('47763484e2298c20fc1d0e779abe5c2c')
sha512sums=('3c7dede088db7344d577db64d7cd6b2b265f32f776f4f411608b88be7a3d4943d78b2602f037f033f4d7d04a7e645796fd54509b9296528ea83b8e891251bd67')
_distdir="MouseX-Traits-0.1102"

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
