# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=perl-tk-fontdialog
pkgver=0.17
pkgrel=1
pkgdesc="Font Dialog Widget"
_dist=Tk-FontDialog
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'tk')
options=('!emptydirs' purge)
source=(http://search.cpan.org/CPAN/authors/id/S/SR/SREZIC/$_dist-$pkgver.tar.gz)

build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
md5sums=('cf3cbf1d2b8311e066279ebafd953a44')
sha256sums=('898b41e2d041b6724b08a04ca72ac69984d408ae7c0aa11989f7428d616e6f1f')
