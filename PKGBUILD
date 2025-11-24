# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-net-stomp'
pkgver='0.62'
pkgrel='1'
pkgdesc="A Streaming Text Orientated Messaging Protocol Client"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0' 'perl-log-any>=1.707' 'perl-log-any-adapter-tap>=0.003003')
makedepends=()
checkdepends=('perl-test-deep>=0' 'perl-test-fatal>=0' 'perl-test-nicedump>=1.0.0')
url='https://metacpan.org/release/Net-Stomp'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAKKAR/Net-Stomp-0.62.tar.gz')
md5sums=('e391a3dd19290ffd44937831527ce85f')
sha512sums=('6491a7c46849f0eab01d774f156274e24edece3e3531ba75d99339e8bbdf16687a7d818bb8cba927aede2a36860df1f8bb46bae3d618b6a92ed0a333a3fd32ae')
_distdir="Net-Stomp-0.62"

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
