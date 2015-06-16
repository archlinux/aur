# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-pod-cpandoc'
pkgver='0.15'
pkgrel='1'
pkgdesc="perldoc that works for modules you don't have installed"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
makedepends=()
url='http://search.cpan.org/dist/Pod-Cpandoc'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SARTAK/Pod-Cpandoc-0.15.tar.gz')
md5sums=('de06c9e2c3fa83952799e35f6c7b980f')
sha512sums=('0df1d963d63c05f59daeeb9948e60db835395baaa66dc659922ca03d8664e2ed72f0dc0e375431865a4b7df33f6a0ca57538324911593668f42384d090e6ec25')
_distdir="Pod-Cpandoc-0.15"

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
