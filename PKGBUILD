# CPAN Name  : constant
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-constant'
pkgver='1.27'
pkgrel='3'
pkgdesc="Perl pragma to declare constants"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/constant'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SAPER/constant-1.27.tar.gz')
md5sums=('1e00a4fbed2b98ae1f447848b132cdd0')
sha512sums=('5840abb036c40c1f0db7d920959c20b01761e2a9e8e8276a7c6fe5dbfec41840c6a4114a378cf8ad7480e310a4328ce876bdd05c11236492c69b8a715d5e0af8')
_distdir="constant-1.27"

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
