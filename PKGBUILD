# Maintainer: gls < ghostlovescorebg at gmail dot com >

pkgname=perl-linux-lvm
pkgver=0.17
pkgrel=1
pkgdesc="Perl extension for accessing Logical Volume Manager (LVM) data structures in Linux."
_dist=Linux-LVM
arch=(any)
url="http://search.cpan.org/~raymor/$_perlmod-$pkgver/"
license=('PerlArtistic')
depends=('perl>=5.10.0')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/R/RA/RAYMOR/${_dist}-${pkgver}.tar.gz")
md5sums=('3ea9aafa7dbbe01c00d0ac70ae44b42b')

build() {

  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make

}

check() {

  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB ROOT
  export PERL_MM_USE_DEFAULT=1
  make test

}

package() {

  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"

}

# vim:set ts=2 sw=2 et:
