# Contributor: Christos Nouskas <nous@archlinux.us>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-test-utf8'
pkgver='1.01'
pkgrel='1'
pkgdesc="handy utf8 tests"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.7.3')
makedepends=()
url='http://search.cpan.org/dist/Test-utf8'
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MARKF/Test-utf8-1.01.tar.gz')
md5sums=('58351d9e168399f6e55fb0982cdbe6a1')
sha512sums=('07dcd5ed98a63f7d96bb0fc629b168773d02bb4c93c5bc44ec60738fc29669794547dfde5913f9de682cd583cf85f4d82b6151398aaebcfec9278525447b9c4e')
_distdir="Test-utf8-1.01"

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
