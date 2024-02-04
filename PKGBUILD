# Maintainer: Pappy STĂNESCU <pappy _AT_ a s c e l i o n _DOT_ com>

_cpan_name=Test-WWW-Mechanize-CGI
_cpan_desc='Test CGI applications with Test::WWW::Mechanize'
_cpan_author=mramberg
_cpan_version=0.1
_cpan_md5=55fea6cdaa85433060c3d55a4982272e

pkgrel=3
pkgname=perl-${_cpan_name,,}
pkgdesc=$_cpan_desc
pkgver=$_cpan_version
md5sums=($_cpan_md5)
depends=('perl-www-mechanize-cgi' 'perl-test-www-mechanize' 'perl-cgi')
makedepends=()
checkdepends=()

_cpan_path=${_cpan_author:0:1}/${_cpan_author:0:2}/${_cpan_author}

url="https://search.cpan.org/~${_cpan_author}/${_cpan_name}-$pkgver"
source=("https://search.cpan.org/CPAN/authors/id/${_cpan_path^^}/${_cpan_name}-$pkgver.tar.gz")
options=(!emptydirs)
arch=('any')

build() {
	cd $srcdir/${_cpan_name}-$pkgver
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
	make test
}

package() {
	cd $srcdir/${_cpan_name}-$pkgver
	make install DESTDIR=$pkgdir
}

