# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-devel-hide'
pkgver='0.0016'
pkgrel=1
pkgdesc="Forces the unavailability of specified Perl modules (for testing)"
arch=('any')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl>=5.6.1')
makedepends=()
url='https://metacpan.org/release/Devel-Hide'
source=("http://search.cpan.org/CPAN/authors/id/D/DC/DCANTRELL/Devel-Hide-${pkgver}.tar.gz")
md5sums=('3c1d44f487c1a4e02b315f2832d8d258')
sha512sums=('9de220dc59530fb3fc1ae165e66a411166a66f968a3d6682ba21838f7855105e0290eda51b3f1b969d450525c5acaddb6b9d6ce086b40fedd36d0447fdd677b0')
_distdir="Devel-Hide-${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
