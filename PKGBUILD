# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname='perl-cpan-outdated'
pkgver='0.32'
pkgrel='2'
pkgdesc="detect outdated CPAN modules in your environment."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs' 'purge')
depends=('perl-cpan-distnameinfo>=0.1' 'perl-uri>=0' 'perl-local-lib>=1.006008' 'perl>=5.8.1')
makedepends=('perl-module-build-tiny')
url='https://metacpan.org/release/cpan-outdated'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOLMEN/cpan-outdated-0.32.tar.gz')
md5sums=('5aef4148c9d5d592414105bef8249271')
sha512sums=('8cc0bd1911f2e0141d285fee4b8d6726d2736637b285b91aae8dad103233f0b445ae5c04a9a66f08f05ba911e77f103133b92c0bf15840723a16339156083481')
_distdir="cpan-outdated-0.32"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
