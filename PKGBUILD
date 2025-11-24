# Contributor: CpanBot <cpanbot at sch bme hu>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-modulebuildtiny'
pkgver='0.020'
pkgrel='1'
pkgdesc="Build a Build.PL that uses Module::Build::Tiny"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=4.300039' 'perl-module-build-tiny>=0.039' 'perl-moose>=0' 'perl-moosex-types>=0' 'perl-moosex-types-perl>=0' 'perl-path-tiny>=0' 'perl>=5.020')
makedepends=()
checkdepends=('perl-dist-zilla>=0' 'perl-test-deep>=0' 'perl-test-fatal>=0')
url='https://metacpan.org/release/Dist-Zilla-Plugin-ModuleBuildTiny'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Dist-Zilla-Plugin-ModuleBuildTiny-0.020.tar.gz')
md5sums=('a4b00a1af8974dda1c25f440811fb25a')
sha512sums=('aca470fae907dfc0625e3b410de79c8ada73d0c321d5213372a7097d34c56a0aef3779ec79b32eab1b827029e5382488fe01cbf167632857041bb2c2365cb9b1')
_distdir="Dist-Zilla-Plugin-ModuleBuildTiny-0.020"

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
