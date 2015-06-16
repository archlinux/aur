# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-cgi-struct'
pkgver='1.21'
pkgrel='1'
pkgdesc="Build structures from CGI data"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-test-deep>=0')
url='http://search.cpan.org/dist/CGI-Struct'
source=('http://search.cpan.org/CPAN/authors/id/F/FU/FULLERMD/CGI-Struct-1.21.tar.gz')
md5sums=('4fd2da8759344f16553c2058bfee3a48')
sha512sums=('3d202c4b7284789c1352a2625c05d8a004ac410e02268bc8125e8ab568ce3d4111249e4799e3536caf35a1b6c85d76669cb714b2e582bae942e2c8b220e42dcd')
_distdir="CGI-Struct-1.21"

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
