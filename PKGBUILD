#Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=perl-devel-camelcadedb
pkgver=1.6.1.6
pkgrel=1
pkgdesc='Perl side of the Perl debugger for IntelliJ IDEA and other JetBrains IDE'
_dist=Devel-Camelcadedb
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('MIT')
depends=('perl-hash-storediterator>=0' 'perl-json-xs>=3.02' 'perl-padwalker>=2.2' 'perl>=5.008')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/H/HU/HURRICUP/$_dist-$pkgver.tar.gz")

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

sha1sums=('453324e30c5b5fb051d99bc9c03d14074eb4e85d')
sha256sums=('267e5673962d79a670b763e35813a14097a8eac9f9e15328db7cced3583c6195')
