# Contributor: BluePeril <blueperil@blueperil.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojolicious-plugin-authentication'
pkgver='1.37'
pkgrel='1'
pkgdesc="A plugin to make authentication a bit easier"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=8.0' 'perl>=5.016')
makedepends=()
url='https://metacpan.org/release/Mojolicious-Plugin-Authentication'
source=("http://search.cpan.org/CPAN/authors/id/J/JJ/JJATRIA/Mojolicious-Plugin-Authentication-${pkgver}.tar.gz")
md5sums=('c475f2d3962441698b178ad1bd7d2e29')
sha512sums=('f0b5cc37a0d66cf45e907727b72caee94f101b32ae82263bc052c40912ea773d7d0db3a94f7f862a95b9a05b9ca1634f0bca075a3af8b4891f70e0928873068a')
_distdir="Mojolicious-Plugin-Authentication-${pkgver}"

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
