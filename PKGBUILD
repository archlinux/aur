# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-config-json'
pkgver='1.5100'
pkgrel='1'
pkgdesc="A JSON based config file system."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-any-moose>=0.13' 'perl-json>=2.16')
makedepends=('perl-test-deep>=0.095')
url='http://search.cpan.org/dist/Config-JSON'
source=('http://search.cpan.org/CPAN/authors/id/R/RI/RIZEN/Config-JSON-1.5100.tar.gz')
md5sums=('26918705ca68a635d391e4d809a78e3b')
sha512sums=('09de924b251e14e98602dd1db74e09e975b0a6c4d0ddfb9a5ed3d32198f206ad51b79061e6f05122507baab45123379bfb589add17d7f2e0fab16ac71a2ce0f8')
_distdir="Config-JSON-1.5100"

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
