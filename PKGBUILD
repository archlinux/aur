# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-travel-status-de-vrr'
pkgver='2.00'
pkgrel='1'
pkgdesc="unofficial VRR departure monitor."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0' 'perl-datetime>=0' 'perl-lwp-protocol-https>=0' 'perl-xml-libxml>=0' 'perl-libwww>=0' 'perl>=5.10.1')
makedepends=('perl-file-slurp>=0' 'perl-module-build>=0.4' 'perl-test-pod>=0')
url='https://metacpan.org/release/Travel-Status-DE-VRR'
source=('http://search.cpan.org/CPAN/authors/id/D/DE/DERF/Travel-Status-DE-VRR-2.00.tar.gz')
md5sums=('caf301e1616ae85aae610ef22e300656')
sha512sums=('954b670c68a4f1cb00e7e2defe192d77fda1df67abfa55cdcd5243441a5eaae2298eb8706d11da59cdeb06266ba90b4fdfaa5c7f2ac35b2e68df2fcdcb23fd3f')
_distdir="Travel-Status-DE-VRR-2.00"

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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
