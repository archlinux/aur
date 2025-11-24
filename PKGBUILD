# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-netmask'
pkgver='2.0003'
pkgrel='1'
pkgdesc="parse, manipulate and lookup IP network blocks"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.1')
makedepends=()
checkdepends=('perl-test-useallmodules>=0.17')
url='https://metacpan.org/release/Net-Netmask'
source=('http://search.cpan.org/CPAN/authors/id/J/JM/JMASLAK/Net-Netmask-2.0003.tar.gz')
md5sums=('51faab7f4fae54017696fb2cbd038bf4')
sha512sums=('2ac22b0f5d97af4615deec0591d2ef3091d421b93224eb36e5c6f5ae291ebf95572453152b7e27d2663186a20cc130a6b3d1fa4438113f96864f1565ee038cb6')
_distdir="Net-Netmask-2.0003"

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
