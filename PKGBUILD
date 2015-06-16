# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-catalyst-plugin-configloader'
pkgver='0.34'
pkgrel='1'
pkgdesc="Load config files of various types"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-catalyst-runtime>=5.7008' 'perl-config-any>=0.20' 'perl-data-visitor>=0.24' 'perl-mro-compat>=0.09' 'perl>=5.8.0')
makedepends=('perl-path-class')
url='http://search.mcpan.org/dist/Catalyst-Plugin-ConfigLoader'
source=('http://search.mcpan.org/CPAN/authors/id/B/BO/BOBTFISH/Catalyst-Plugin-ConfigLoader-0.34.tar.gz')
md5sums=('783b51f2f8113041cf2ab6c1a351bfce')
sha512sums=('294826900f11b9c00a5106f71b3b778e3a9c41bd7ff5bd7e3a6c376242f330c9a4c9473a15854e7bba730b90a01711edfc4221d54d8609ab0f8480c95d59c115')
_distdir="Catalyst-Plugin-ConfigLoader-0.34"

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
