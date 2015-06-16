# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-dist-zilla-plugin-test-minimumversion'
pkgver='2.000005'
pkgrel='187'
pkgdesc="Release tests for minimum required versions"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla' 'perl-moose' 'perl-moose-autobox')
makedepends=()
checkdepends=('perl-dist-zilla' 'perl-test-minimumversion' 'perl-test-output')
url='http://search.mcpan.org/dist/Dist-Zilla-Plugin-Test-MinimumVersion'
source=('http://search.mcpan.org/CPAN/authors/id/D/DO/DOHERTY/Dist-Zilla-Plugin-Test-MinimumVersion-2.000005.tar.gz')
md5sums=('08e43f2a58e39652242c0304ad1a58d5')
sha512sums=('d2cea9fd272dde3c7ba450a17794355a94d7666b195ecd794e5ade0ed8ffc6cf330028b5a729d84b0f6854777f9f5beb55cf4e14716ec50cf70e5f701bfee106')
_distdir="Dist-Zilla-Plugin-Test-MinimumVersion-2.000005"

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
