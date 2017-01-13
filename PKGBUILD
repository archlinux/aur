# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# OLD-Maintainer: sportscliche <mph at sportscliche dot com>

pkgname=perl-pdf-labels
pkgver=1.8
pkgrel=1
pkgdesc='This packages the perl-pdf-labels distribution, containing the PDF::Labels module!'
_dist=PDF-Labels
arch=('any')
url="http://search.cpan.org/dist/PDF-Labels"
license=('GPL' 'PerlArtistic')
depends=('perl-pdf-create')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/O/OW/OWEN/$_dist-$pkgver.tar.gz")

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
md5sums=('045898e035187446a5d643c832d55251')
sha256sums=('82d38a7bba69a859b0d817abc8ad6c5e13e90c37e8c05749fb9f4d47a1930187')
