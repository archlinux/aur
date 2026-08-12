# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-mojo-jwt'
pkgver='1.02'
pkgrel='1'
pkgdesc="JSON Web Token the Mojo way"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-cryptx>=0.029' 'perl-mojolicious>=5.00' 'perl>=5.010')
makedepends=('perl-module-build-tiny')
url='https://metacpan.org/release/Mojo-JWT'
source=("http://search.cpan.org/CPAN/authors/id/J/JB/JBERGER/Mojo-JWT-${pkgver}.tar.gz")
md5sums=('f29d2bdc255c4f4f1bd16bf3a11a3446')
sha512sums=('6120d9f990948893bfd00a418a6e92b4997e7b6829b19a4746e2bbe30408ca55621114be2e7cb4fed29cc438bd1d45030ec5aec8638fe42799c58705c35b63b9')
_distdir="Mojo-JWT-${pkgver}"

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
