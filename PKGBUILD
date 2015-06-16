# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-text-simpletable'
pkgver='2.03'
pkgrel='1'
pkgdesc="Simple eyecandy ASCII tables"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Text-SimpleTable'
source=('http://search.cpan.org/CPAN/authors/id/M/MR/MRAMBERG/Text-SimpleTable-2.03.tar.gz')
md5sums=('a79a1f53846c111e8f6056702c39fa17')
sha512sums=('1328f59d0f68e4d083cb7e8b0ecc353a162462e5b736b7603da0e42a521728c565d8c224042c1fd94032c481dc689b90686295493a1a7b8e1a0d426275e14ffd')
_distdir="Text-SimpleTable-2.03"

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
