# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-pod-strip'
pkgver='1.02'
pkgrel='1'
pkgdesc="Remove POD from Perl code"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Pod-Strip'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOMM/Pod-Strip-1.02.tar.gz')
md5sums=('b5ac7b0e68d8d44bd737f1ba71aaee3f')
sha512sums=('cd328b5cb3ef6fa4ae46f4217b9b30e5a0341607f10d66c9046d5a37ada13947fc9e05431af495e6793e472620d883ff277c02e1f33a5d82e72a16f625447ee9')
_distdir="Pod-Strip-1.02"

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
