# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=perl-tk-splash
pkgver=0.16
pkgrel=1
pkgdesc="create a splash screen "
_dist=Tk-Splash
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'tk')
replaces=('tk-splash')
options=('!emptydirs' 'purge')
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
md5sums=('0fa1f21f98e558fe07d9dfcd0350c256')
sha256sums=('8b2c942b30a346ff9e919aef98dae169c491ba10c6c6ee7546e63aeb8467f76a')
