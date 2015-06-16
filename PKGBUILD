# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-moosex-app-cmd'
pkgver='0.30'
pkgrel='1'
pkgdesc="Mashes up MooseX::Getopt and App::Cmd"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-app-cmd>=0.321' 'perl-getopt-long-descriptive>=0.091' 'perl-moose' 'perl-moosex-getopt' 'perl-yaml' 'perl-namespace-autoclean' 'perl>=5.8.5')
makedepends=()
checkdepends=('perl-test-output')
url='http://search.mcpan.org/dist/MooseX-App-Cmd'
source=('http://search.mcpan.org/CPAN/authors/id/E/ET/ETHER/MooseX-App-Cmd-0.30.tar.gz')
md5sums=('0723db82fc97e3496124cd0530019026')
sha512sums=('468caa76367bf2eb005fd43eb25109f4be1fbbbe3934db6a5f45b574a2fb0b79ced07c2826f19313ad2dba882194035fc4925f25429cdcbf3159b4c5d0040cdf')
_distdir="MooseX-App-Cmd-0.30"

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
