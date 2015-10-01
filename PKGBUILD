# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-sub-exporter-globexporter'
pkgver='0.004'
pkgrel='1'
pkgdesc="export shared globs with Sub::Exporter collectors"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-sub-exporter')
makedepends=()
url='https://metacpan.org/release/Sub-Exporter-GlobExporter'
source=('http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Sub-Exporter-GlobExporter-0.004.tar.gz')
md5sums=('52597b6e678409eac7c17f8216a4c7cb')
sha512sums=('00a61e640afc2e8ac1d0a664d255950dfbbfcf61e0228e7fe36e13a9314f827b478f694519da1dd00b22b6307930c216fb5a53bbae00e46e8e717d865db3365a')
_distdir="Sub-Exporter-GlobExporter-0.004"

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
