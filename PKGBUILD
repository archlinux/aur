# Contributor: K. Hampf <k.hampf@gmail.com>
pkgname=perl-xml-treepp
_authorpath=K/KA/KAWASAKI # this is uggly
pkgver=0.43
pkgrel=2
pkgdesc='XML::TreePP module parses an XML document and expands it for a hash tree.'
_dist=XML-TreePP
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('GPL' 'PerlArtistic')
depends=(perl)
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/$_authorpath/$_dist-$pkgver.tar.gz")
md5sums=('f69693066e52591bf1142d3f4e6d37e5')

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
