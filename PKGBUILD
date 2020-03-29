# # Maintainer: int <int [ate] arcor [dot] de>
# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-package-variant'
pkgver='1.003002'
_distdir="Package-Variant-${pkgver}"
pkgrel='1'
pkgdesc="Perl/CPAN Module Package::Variant: Parameterizable packages"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-import-into' 'perl-module-runtime>=0.013' 'perl' 'perl-strictures')
makedepends=()
checkdepends=('perl-test-fatal')
url='https://metacpan.org/release/Package-Variant'
source=("http://search.cpan.org/CPAN/authors/id/M/MS/MSTROUT/${_distdir}.tar.gz")
md5sums=('f898ec7426e051ca4431fd8afed24937')
sha512sums=('0f311e73049df9a7a43a3e9eb3e4ba48120d119ab92161a4c0da532625d5705c6ee5b50f57d6b40ded30df82ce13b9dcced28894ddc7ee0068787b782fd33a4a')

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

  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
