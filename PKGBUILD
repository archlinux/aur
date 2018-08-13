# Maintainer: Pappy STĂNESCU <pappy _AT_ a s c e l i o n _DOT_ com>

_cpan_name=Authen-Simple-RADIUS
_cpan_desc='Simple RADIUS authentication'
_cpan_author=chansen
_cpan_version=0.1
_cpan_md5=e5a5bc72f2b8f8fe0e5a9eff085e23b2

pkgrel=2
pkgname=perl-${_cpan_name,,}
pkgdesc=$_cpan_desc
pkgver=$_cpan_version
md5sums=($_cpan_md5)
depends=('perl-authen-simple' 'perl-authen-radius' 'perl-net-ip')
makedepends=('perl-test-pod' 'perl-test-pod-coverage')
checkdepends=()

_cpan_path=${_cpan_author:0:1}/${_cpan_author:0:2}/${_cpan_author}

url="http://search.cpan.org/~${_cpan_author}/${_cpan_name}-$pkgver"
source=("http://search.cpan.org/CPAN/authors/id/${_cpan_path^^}/${_cpan_name}-$pkgver.tar.gz")
options=(!emptydirs)
arch=('any')

build() {
	cd $srcdir/${_cpan_name}-$pkgver
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
	TEST_POD=true make test
}

package() {
	cd $srcdir/${_cpan_name}-$pkgver
	make install DESTDIR=$pkgdir
}

