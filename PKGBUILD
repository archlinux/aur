# Submitter  : gergan_penkov
# Maintainer : gergan_penkov
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-test-unit-lite'
pkgver='0.1202'
pkgrel='1'
pkgdesc="Unit testing without external dependencies"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Test-Unit-Lite'
source=('http://search.cpan.org/CPAN/authors/id/D/DE/DEXTER/Test-Unit-Lite-0.1202.tar.gz')
md5sums=('2ccb9d4fe1d702c5b88838d91abfe3e3')
sha512sums=('4a02b5761df60f01b3f4dce2d31f287eee7725e1c3a2d22fca2e3c333dc9cb14b34ae7badc09acff53a37bdb11a791b7914ca42876647204535324ed001c13b5')
_distdir="Test-Unit-Lite-0.1202"

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
