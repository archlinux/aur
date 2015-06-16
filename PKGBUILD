# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-html-stripscripts'
pkgver='1.05'
pkgrel='1'
pkgdesc="Strip scripting constructs out of HTML"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/HTML-StripScripts'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DRTECH/HTML-StripScripts-1.05.tar.gz')
md5sums=('e8c51fbfda69efaf94c2937084d2458f')
sha512sums=('e9de1a05721fa74b90168ef36596c4d32d5af365258f1a8b363ac7a2e2f15181e67cbadde1c1dcae1225b6d2850589fa14e252134cf799b84bf506f55f5e050d')
_distdir="HTML-StripScripts-1.05"

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
