# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-css-lessp'
pkgver='0.86'
pkgrel='1'
pkgdesc="LESS for perl. Parse .less files and returns valid css (lesscss.org for more info about less files)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/CSS-LESSp'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DRINCHEV/CSS-LESSp-0.86.tar.gz')
md5sums=('3d454551f3d9f00372c3508f4d7317ed')
sha512sums=('b2390cdf656f7390a73fdb54a6ce7f455eb94ac0b2d7dd8c28f69907f09ce63bd9beec913d3bcc3cde66e1e4798c14a19d68cadca36edccaff0c55b0b65f0cfc')
_distdir="CSS-LESSp-0.86"

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
