# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-irc-utils'
pkgver='0.12'
pkgrel='1'
pkgdesc="Common utilities for IRC-related tasks"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/IRC-Utils'
source=('http://search.cpan.org/CPAN/authors/id/H/HI/HINRIK/IRC-Utils-0.12.tar.gz')
md5sums=('05e99007ca07dbb9b77e534c71d2a5c1')
sha512sums=('b1b7bae3d374e0755d46c02adf37ee719a8f40b600b39722b6674bcf61e31ca442373e29974e7d458b82af382dca7a65f8f687bd0857eb8c9f27861c380dae29')
_distdir="IRC-Utils-0.12"

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
