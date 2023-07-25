# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# OLD-Maintainer: Naoki Kawakami <nkawakami atto parallels dotto com>
# OLD-Module author: Markus Baertschi
# OLD-Contributor: sportscliche <mph at sportscliche dot com>
# OLD-Generator  : CPANPLUS::Dist::Arch 1.29

pkgname=perl-pdf-create
pkgver=1.46
pkgrel=1
pkgdesc='This packages the perl-pdf-create distribution, containing the PDF::Create module!'
_dist=PDF-Create
arch=('any')
url="http://search.cpan.org/dist/PDF-Create"
license=('GPL' 'PerlArtistic')
depends=('perl-file-share')
options=('!emptydirs' purge)
makedepends=('perl-json' 'perl-file-sharedir-install')
checkdepends=('perl-test-leaktrace>=0.14')
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MANWAR/$_dist-$pkgver.tar.gz")

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
md5sums=('0b08555c19730fed003dc2d8a313ace4')
sha256sums=('27a21cc1e4b817732b76faf4497ccaa0a7009dceead9d017696cea620fcecf58')
