# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-catalystx-injectcomponent'
pkgver='0.025'
pkgrel='1'
pkgdesc="Inject components into your Catalyst application"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=5.8' 'perl-class-inspector')
makedepends=('perl-test-most')
url='http://search.cpan.org/dist/CatalystX-InjectComponent'
source=('http://search.cpan.org/CPAN/authors/id/R/RO/ROKR/CatalystX-InjectComponent-0.025.tar.gz')
md5sums=('90a89d4b1d41155e4dd3c0ec5e951f92')
sha512sums=('0531f12c79e415e69e9933f25ad04e44a31d45482d5665ea59ed4782fe8d17c0182e224f5275eb88adc9a5a566ded6638c408d74dbc1d75a20f9c6f47b03e3b8')
_distdir="CatalystX-InjectComponent-0.025"

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
