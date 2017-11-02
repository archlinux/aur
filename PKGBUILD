#Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=perl-devel-camelcadedb
pkgver=2017.100.2
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

sha1sums=('41dd91ae57bbca2f28a7af283e185b2e2d5a4b20')
sha256sums=('c9cb7061989211dd9d6e9fb7adf2d719731ebf8e23d0d0ba6a0300e54db4d00b')
