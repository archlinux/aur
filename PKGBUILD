# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-www-mechanize-formfiller'
pkgver='0.13'
pkgrel='1'
pkgdesc="framework to automate HTML forms"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-random>=0.05' 'perl-html-form>=0' 'perl-html-tagset>=0')
makedepends=()
url='https://metacpan.org/release/WWW-Mechanize-FormFiller'
source=('http://search.cpan.org/CPAN/authors/id/C/CO/CORION/WWW-Mechanize-FormFiller-0.13.tar.gz')
md5sums=('e20dd74e1e9d50211bdcc459cc8ed74e')
sha512sums=('9ddfb677dbd17da327980c349577593d5795044553b9c5966f70d095c8dc3439ae8991f082eab787f2cf45a45288ee719ac6a0a4d2e73caff0cf24abe3d0e5c0')
_distdir="WWW-Mechanize-FormFiller-0.13"

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
