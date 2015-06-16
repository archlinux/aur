# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-sub-delete'
pkgver='1.00002'
pkgrel='1'
pkgdesc="Perl module enabling one to delete subroutines"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Sub-Delete'
source=('http://search.cpan.org/CPAN/authors/id/S/SP/SPROUT/Sub-Delete-1.00002.tar.gz')
md5sums=('3c0b6adb2a241f626245b72688efd5aa')
sha512sums=('41a926099634e24d805756123be6ed7153568b45acc061fa5b3d91141eea6a1c6109681a725f4351bcbe6ef320210d2f18800b7da7e9631574f535979ff22e06')
_distdir="Sub-Delete-1.00002"

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
