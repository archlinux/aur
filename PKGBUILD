# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-jwt'
pkgver='1.01'
pkgrel='1'
pkgdesc="JSON Web Token the Mojo way"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cryptx>=0.029' 'perl-mojolicious>=5.00' 'perl>=5.010')
makedepends=('perl-module-build-tiny')
url='https://metacpan.org/release/Mojo-JWT'
source=('http://search.cpan.org/CPAN/authors/id/J/JB/JBERGER/Mojo-JWT-1.01.tar.gz')
md5sums=('e20c8acd989a2f70cb565d662ce73a0a')
sha512sums=('a02a899b64f1e735f1c98780800e751a75998fda6e00f65fde722e33a6c0e7fa5a5ad8040def57b865cc44175ff971a532664986f6462832ccb3207f5e87befb')
_distdir="Mojo-JWT-1.01"

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
