# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moosex-app-cmd'
pkgver='0.32'
pkgrel='1'
pkgdesc="Mashes up MooseX::Getopt and App::Cmd"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-app-cmd>=0.321' 'perl-getopt-long-descriptive>=0.091' 'perl-moose' 'perl-moosex-getopt' 'perl-moosex-nonmoose' 'perl-yaml' 'perl-namespace-autoclean' 'perl>=5.8.5')
makedepends=()
checkdepends=('perl-test-output')
url='https://metacpan.org/release/MooseX-App-Cmd'
source=('http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-App-Cmd-0.32.tar.gz')
md5sums=('3499156dc87db7f6399ab8194bf0a3c1')
sha512sums=('5cafa97703907ddaa2b4bd993bb5b093842e4fa8a680df38426904fa1ea71112363756e8b9f2c6a67a6105c9ad00e59cbdc9ec112c386d3f8b92473b83b728ad')
_distdir="MooseX-App-Cmd-0.32"

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
