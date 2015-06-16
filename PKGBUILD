# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-math-base36'
pkgver='0.12'
pkgrel='1'
pkgdesc="Encoding and decoding of base36 strings"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=('perl-test-exception')
url='http://search.cpan.org/dist/Math-Base36'
source=('http://search.cpan.org/CPAN/authors/id/B/BR/BRICAS/Math-Base36-0.12.tar.gz')
md5sums=('a08048902efcf329aca985e9bf3446eb')
sha512sums=('e9bd6418031354d22cb2e84073a2b308e0644cca6d377207005ee907d50050e700afda6df4e94618289b036a62ce27f8e0ca96722234b101b06977a596331e15')
_distdir="Math-Base36-0.12"

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
