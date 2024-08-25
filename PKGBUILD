# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=perl-tk-fontdialog
pkgver=0.19
pkgrel=1
pkgdesc="Font Dialog Widget"
_dist=Tk-FontDialog
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL-2.0-or-later' 'Artistic-1.0-Perl')
depends=('perl>=5.10.0' 'tk' 'perl-tk')
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
md5sums=('75ceff81dda037979c41e3b78d6dd233')
sha256sums=('7ddce970642f087c40edeb29128e1c59c92815d3a47761c063e6f1086a6141b4')
