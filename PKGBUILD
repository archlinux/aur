# Contributor: orumin <dev@orum.in>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-x11-guitest'
pkgver='0.28'
pkgrel='2'
pkgdesc="Provides GUI testing/interaction routines."
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'libx11>=1.6.2' 'libxtst>=1.2.2')
makedepends=()
url='http://search.cpan.org/dist/X11-GUITest'
source=('http://search.cpan.org/CPAN/authors/id/C/CT/CTRONDLP/X11-GUITest-0.28.tar.gz')
md5sums=('6987e834dbf25734d3aec0014ab89bf6')
sha512sums=('51c719d1448719897893ba55f6f388fb0e58b335a801680ed926f0c72f4d305570256605139f08c113f4675f136ef4a53fb8fd6b5ad69992c9e688ca22ee7e9f')
_distdir="X11-GUITest-0.28"

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
