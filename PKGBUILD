# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-catalyst-plugin-configloader'
pkgver='0.35'
pkgrel='1'
pkgdesc="Load config files of various types"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime' 'perl-config-any' 'perl-data-visitor')
checkdepends=('perl-perlio-utf8-strict')
url='http://search.mcpan.org/dist/Catalyst-Plugin-ConfigLoader'
source=('https://cpan.metacpan.org/authors/id/H/HA/HAARG/Catalyst-Plugin-ConfigLoader-0.35.tar.gz')
sha256sums=('9e2a698a6f2d046e0dc5e57512929cd423c807d4a36ba3f29e9e5adcd71a1971')
_distdir="Catalyst-Plugin-ConfigLoader-0.35"

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
