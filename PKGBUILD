# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-log-dispatch'
pkgver='2.57'
pkgrel='1'
pkgdesc="Dispatches messages to one or more outputs"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-devel-globaldestruction' 'perl-dist-checkconflicts>=0.02' 'perl-ipc-run3' 'perl-module-runtime' 'perl-params-validate>=1.03' 'perl>=5.006')
makedepends=()
checkdepends=('perl-test-fatal' 'perl-test-needs')
url='https://metacpan.org/release/Log-Dispatch'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Log-Dispatch-2.57.tar.gz')
md5sums=('2cb5bc33f3bb11ccdff5f584b6b573b5')
sha512sums=('eca2938493ec2e846d857f5fb39349cea1956f487a71b89ef1aca2b85cd5aa1c409ae6348468fcf86a9b1d877f81c224b629da0fb60dbf483fe14886afeb196e')
_distdir="Log-Dispatch-2.57"

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
