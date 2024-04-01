# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-travel-status-de-deutschebahn'
pkgver='5.06'
pkgrel='1'
pkgdesc="Interface to the online arrival/departure"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor>=0.16' 'perl-datetime>=0' 'perl-datetime-format-strptime>=0' 'perl-json>=0' 'perl-lwp-protocol-https>=0' 'perl-list-moreutils>=0' 'perl-libwww>=0' 'perl>=5.14.0')
makedepends=('perl-module-build>=0.4' 'perl-test-compile>=0' 'perl-test-pod>=0')
checkdepends=('perl-file-slurp>=0')
url='https://metacpan.org/release/Travel-Status-DE-DeutscheBahn'
source=('http://search.cpan.org/CPAN/authors/id/D/DE/DERF/Travel-Status-DE-DeutscheBahn-5.06.tar.gz')
md5sums=('7aee97fd05730d0071ce1df7e1940bbb')
sha512sums=('0893f0dfeb8e09a9dcef04d849d6fcda7a24c68465b87b5269d7afc09856fbafa7187a10131b848969b339311292240c23e293c2781be164b9dde112155a7480')
_distdir="Travel-Status-DE-DeutscheBahn-5.06"

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
