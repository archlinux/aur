# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-modulebuildtiny'
pkgver='0.015'
pkgrel='1'
pkgdesc="Build a Build.PL that uses Module::Build::Tiny"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=4.300039' 'perl-module-build-tiny>=0.039' 'perl-moose>=0' 'perl-moosex-types-perl>=0' 'perl-path-tiny>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-dist-zilla>=0' 'perl-test-deep>=0' 'perl-test-fatal>=0')
url='https://metacpan.org/release/Dist-Zilla-Plugin-ModuleBuildTiny'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Dist-Zilla-Plugin-ModuleBuildTiny-0.015.tar.gz')
md5sums=('8887e08f0cdef9a2b4226b67e97699a8')
sha512sums=('d63138a5e83b35092d4b4913b4a6d83a87c8c67898cf88edd0b5a46a308a098c80955c2d5c7f7061b68dbbbc410a5c9027627099d07635751add5c3721c6c0ab')
_distdir="Dist-Zilla-Plugin-ModuleBuildTiny-0.015"

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
