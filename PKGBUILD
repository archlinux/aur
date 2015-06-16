# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-template-plugin-json'
pkgver='0.06'
pkgrel='1'
pkgdesc="Adds a .json vmethod for all TT values."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-json>=2.12' 'perl-moose' 'perl-template-toolkit')
makedepends=('perl-test-use-ok')
url='http://search.cpan.org/dist/Template-Plugin-JSON'
source=('http://search.cpan.org/CPAN/authors/id/N/NU/NUFFIN/Template-Plugin-JSON-0.06.tar.gz')
md5sums=('a8ea2961cad97a848741a65caad3dad9')
sha512sums=('f687434a583e638c7d06cd733376d432353a5c1628d2a5fe0f625a92b3cbe9a9e213d4a5ec42c05f9748ecd17bffd636eed89a92c12b0c1a95d7bfe48fd11d32')
_distdir="Template-Plugin-JSON-0.06"

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
