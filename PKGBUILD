# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-tree-rb'
pkgver='0.500003'
pkgrel='1'
pkgdesc="Perl implementation of the Red/Black tree, a type of balanced binary search tree. "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-enum')
makedepends=()
url='http://search.cpan.org/dist/Tree-RB'
source=('http://search.cpan.org/CPAN/authors/id/A/AR/ARUNBEAR/Tree-RB-0.500003.tar.gz')
md5sums=('bbb93c117fe73dca1b10e97cda33724f')
sha512sums=('df628ab32d48db7285c393b48fba474bc4fe52521b0bc8424f97120e32cbfe6b4de87ee35098025f34bae8fcf73e1abf40ffb1aa828fc9fa9c6b4a760bd98d27')
_distdir="Tree-RB-0.500003"

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
