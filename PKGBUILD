# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-future-io'
pkgver='0.17'
pkgrel='1'
pkgdesc="Future-returning IO methods"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-future' 'perl-struct-dumb' 'perl>=5.014')
makedepends=('perl-module-build>=0.4004')
checkdepends=('perl-test-expectandcheck>=0.06' 'perl-test-future-io-impl>=0.15')
url='https://metacpan.org/release/Future-IO'
source=('http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Future-IO-0.17.tar.gz')
md5sums=('3de59ae264a39f6afc383c8500f99c1a')
sha512sums=('671eb8f2eee0cda55477631fd6a89bcc98495cd98e98bef55ed5b50e2b877f47451fcaed98cec48d13604351dd96ea06b69bab80246c393aa69b3940efca52b6')
_distdir="Future-IO-0.17"

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
