# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-dist-zilla-plugin-test-distmanifest'
pkgver='2.000004'
pkgrel='8675309'
pkgdesc="Release tests for the manifest"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-capture-tiny' 'perl-dist-zilla' 'perl-moose' 'perl-moose-autobox')
makedepends=()
checkdepends=('perl-test-distmanifest' 'perl-test-output')
url='http://search.mcpan.org/dist/Dist-Zilla-Plugin-Test-DistManifest'
source=('http://search.mcpan.org/CPAN/authors/id/D/DO/DOHERTY/Dist-Zilla-Plugin-Test-DistManifest-2.000004.tar.gz')
md5sums=('3d95933daec49549f4f2089612385e79')
sha512sums=('32029bb3dc94ddb44aeea908162063872bc60504d55b3c53e3fb20c81a993d37fed9aed7f0208431b627a27aea8a7668969e34ecd1190f0ea5d681f13ac308b4')
_distdir="Dist-Zilla-Plugin-Test-DistManifest-2.000004"

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
