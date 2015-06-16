# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-array-iterator'
pkgver='0.11'
pkgrel='1'
pkgdesc="A simple class for iterating over Perl arrays"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-capture-tiny>=0')
makedepends=()
checkdepends=('perl-test-exception>=0')
url='http://search.cpan.org/dist/Array-Iterator'
source=('http://search.cpan.org/CPAN/authors/id/S/SH/SHARYANTO/Array-Iterator-0.11.tar.gz')
md5sums=('56cbea833adf1dcbc27d3329281e3d2a')
sha512sums=('1f99a09566c31fbce45983f6c92bc1b995b121dd4c110dc2be4fef2ab2a4b88589c91a5f3caa2948d8cc2f1313081a76f25721e1ef61077d58139deb7b542f6f')
_distdir="Array-Iterator-0.11"

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
