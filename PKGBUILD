# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-dist-zilla-plugin-bootstrap-lib'
pkgver='1.001002'
pkgrel='1'
pkgdesc="A minimal boot-strapping for Dist::Zilla Plug-ins."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla-role-bootstrap>=1.000000' 'perl-moose>=0' 'perl>=5.006')
makedepends=()
checkdepends=('perl-dist-zilla>=0')
url='https://metacpan.org/release/Dist-Zilla-Plugin-Bootstrap-lib'
source=('http://search.cpan.org/CPAN/authors/id/K/KE/KENTNL/Dist-Zilla-Plugin-Bootstrap-lib-1.001002.tar.gz')
md5sums=('19372c0acea9cacac561cc87a1e4f5a4')
sha512sums=('12c10c7a2c78a5a3b720fc977580ef82df003430ccb91b9f8dcf5edb4dfa77333b5455fa140b016ba5944f046e28f32f08eb161e62caabc905f1d4d5ea97cc04')
_distdir="Dist-Zilla-Plugin-Bootstrap-lib-1.001002"

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
