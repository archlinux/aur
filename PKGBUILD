# CPAN Name  : Data-Visitor
# Submitter  : aCiD2
# Maintainer : SIGTERM

pkgname='perl-data-visitor'
pkgver='0.30'
pkgrel='1'
pkgdesc="Visitor style traversal of Perl data structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-load>=0.06' 'perl-moose>=0.89' 'perl-namespace-clean>=0.19' 'perl-task-weaken' 'perl-tie-toobject>=0.01')
makedepends=('perl-test-requires')
url='http://search.cpan.org/dist/Data-Visitor'
source=('http://search.cpan.org/CPAN/authors/id/D/DO/DOY/Data-Visitor-0.30.tar.gz')
md5sums=('a43deb0bc99f4d49721965780eae6cef')
sha512sums=('cdd3f5076dbbfb3afce714677e936417b96315dd50735c015795fb2c9d143d4e2ceeb305366f9985032b17899b911267dbafefa56493ff20f16c74da1a9330a8')

build() {
  cd "$srcdir/Data-Visitor-0.30"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Data-Visitor-0.30"
  PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/Data-Visitor-0.30"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}
