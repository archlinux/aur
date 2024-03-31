# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-modulebuildtiny'
pkgver='0.017'
pkgrel='1'
pkgdesc="Build a Build.PL that uses Module::Build::Tiny"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=4.300039' 'perl-module-build-tiny>=0.039' 'perl-moose>=0' 'perl-moosex-types>=0' 'perl-moosex-types-perl>=0' 'perl>=5.006')
makedepends=('perl-module-build-tiny>=0.034' 'perl>=5.4.5')
checkdepends=('perl-dist-zilla>=0' 'perl-path-tiny>=0' 'perl-test-deep>=0' 'perl-test-fatal>=0')
url='https://metacpan.org/release/Dist-Zilla-Plugin-ModuleBuildTiny'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Dist-Zilla-Plugin-ModuleBuildTiny-0.017.tar.gz')
md5sums=('e2df9091d24d964da2a3752e8d4a1d12')
sha512sums=('27314976431b07a90c14637dd768b18d6a520e1b786eff3985e3d96705d6d66211893b989b0810b14383dff7eb6e2b68395540373fc921968f37aacb9ea42466')
_distdir="Dist-Zilla-Plugin-ModuleBuildTiny-0.017"

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
