# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-business-issn'
pkgver='0.91'
pkgrel='1'
pkgdesc="Work with International Standard Serial Numbers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Business-ISSN'
source=('http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/Business-ISSN-0.91.tar.gz')
md5sums=('d1f609422d3a0ad5e301ae694d142fe4')
sha512sums=('5a7d098feda97088b89b58313c2f05555a0c15f3220fa7bf6d77428e38cc25dc747671813ec64c67ed90ac0f29de4c6aaeb846d7ff41ba1e8e54b4a24c6adb31')
_distdir="Business-ISSN-0.91"

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
