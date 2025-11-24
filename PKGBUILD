# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-travel-status-de-vrr'
pkgver='3.17'
pkgrel='1'
pkgdesc="unofficial VRR departure monitor."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor' 'perl-datetime' 'perl-datetime-format-strptime' 'perl-json' 'perl-lwp-protocol-https' 'perl-uri' 'perl-libwww' 'perl>=5.10.1')
makedepends=('perl-file-slurp' 'perl-module-build>=0.4')
url='https://metacpan.org/release/Travel-Status-DE-VRR'
source=('http://search.cpan.org/CPAN/authors/id/D/DE/DERF/Travel-Status-DE-VRR-3.17.tar.gz')
md5sums=('0f954c4193963034121a18b211d4fdb9')
sha512sums=('dd99b209edad52400bf82c18c1008d04fd0d27cbdeac7f18e323c538dd4e9d2183b275ba48dc9aff880af144be9d33b0ec3a4a2c01be195fa35a2de6953d60af')
_distdir="Travel-Status-DE-VRR-3.17"

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
