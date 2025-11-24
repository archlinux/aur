# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-travel-status-de-deutschebahn'
pkgver='6.15'
pkgrel='1'
pkgdesc="Interface to the online arrival/departure"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0.16' 'perl-datetime>=0' 'perl-datetime-format-strptime>=0' 'perl-file-slurp>=0' 'perl-json>=0' 'perl-lwp-protocol-https>=0' 'perl-list-moreutils>=0' 'perl-libwww>=0' 'perl>=5.14.0')
makedepends=()
checkdepends=('perl-test-compile>=0' 'perl-test-pod>=0')
url='https://metacpan.org/release/Travel-Status-DE-DeutscheBahn'
source=('http://search.cpan.org/CPAN/authors/id/D/DE/DERF/Travel-Status-DE-DeutscheBahn-6.15.tar.gz')
md5sums=('4b9cc562aba6ba5c1ec8f6d35466e3cb')
sha512sums=('c7352b6053b710a45d0f9f02dfbae6dc1d6e99da179b51adcc37edac4cd895f3f96a9c09501099ba6aededfb7447e0a220c3de334c6c4ce28b7732a3a7904bfe')
_distdir="Travel-Status-DE-DeutscheBahn-6.15"

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
