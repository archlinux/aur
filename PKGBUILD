# Maintainer : Alex Kubica <alexkubicail@gmail.com>
pkgname=perl-text-bidi
_dist=Text-Bidi
pkgver=2.12
pkgrel=1
pkgdesc="Unicode bidi algorithm using libfribidi"
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl)
makedepends=(perl-extutils-pkgconfig)
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/K/KA/KAMENSKY/$_dist-$pkgver.tar.gz") 
md5sums=('075019229cd1e6ce452494fb87959f32')

build() {
  cd $srcdir/${_dist}-${pkgver}
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
