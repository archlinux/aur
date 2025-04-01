# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-parse-debian-packages'
pkgver='0.03'
pkgrel='1'
pkgdesc="parse the data from a debian Packages.gz"
arch=('any')
license=(unknown)
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='https://metacpan.org/release/Parse-Debian-Packages'
source=('http://search.cpan.org/CPAN/authors/id/R/RC/RCLAMP/Parse-Debian-Packages-0.03.tar.gz')
md5sums=('7d279cfa356d7c6057997a34022f16ef')
sha512sums=('0e0ac688f9bb06406d95205d659bdaee4f56afaa19f1924933bfa8f2ef627ee51bbb41283aa8cac1bc7dd49c54cfa9ec946611d179b7456d1eeb970eed37996e')
_distdir="Parse-Debian-Packages-0.03"

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
